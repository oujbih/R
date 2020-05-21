# Print first 10 observations
head(biopics, 10)

# Get the number of missing values per variable
biopics %>%
	is.na() %>% 
	colSums()


# Fit linear regression to predict earnings
model_2 <- lm(earnings ~ country + year + sub_type + sub_race, 
              data = biopics)





#t-test 
# Create a dummy variable for missing earnings
biopics <- biopics %>% 
  mutate(missing_earnings = is.na(earnings))

# Pull the missing earnings dummy for males
missing_earnings_males <- biopics %>% 
  filter(sub_sex == "Male") %>% 
  pull(missing_earnings)

# Pull the missing earnings dummy for females
missing_earnings_females <- biopics %>% 
  filter(sub_sex == "Female") %>% 
  pull(missing_earnings)

# Run the t-test
t.test(missing_earnings_males, missing_earnings_females)




#Plot data missing 
# Load the VIM package
library(VIM)

# Draw an aggregation plot of biopics
biopics %>% 
	aggr(combined = TRUE, numbers = TRUE)


# Draw a spine plot to analyse missing values in earnings by sub_race
biopics %>% 
	select(sub_race, earnings) %>%
	spineMiss()


# Prepare data for plotting and draw a mosaic plot
biopics %>%
	# Create a dummy varia	ble for US-produced movies
	mutate(is_US_movie = grepl("US", country)) %>%
	# Draw mosaic plot
	mosaicMiss(highlight = "earnings", 
             plotvars = c("is_US_movie", "sub_sex"))

# Return plot from latest VIM package - expand the HTML viewer section
display_image()	



tao_imp <- tao %>% 
  # Create a binary indicator for missing values in air_temp
  mutate(air_temp_imp = ifelse(is.na(air_temp), TRUE, FALSE)) %>%
  # Impute air_temp with its mean
  mutate(air_temp = ifelse(is.na(air_temp), mean(air_temp, na.rm = TRUE), air_temp))

# Print the first 10 rows of tao_imp
head(tao_imp, 10)


# Draw a margin plot of air_temp vs sea_surface_temp -----------------------------------------------------
tao_imp %>% 
  select(air_temp, sea_surface_temp, air_temp_imp) %>%
  marginplot(delimiter = "imp")


#vim --------------------------------------------------------------------

# Load VIM package
library(VIM)

# Impute air_temp in tao with hot-deck imputation
tao_imp <- hotdeck(tao, variable = "air_temp")


# Check the number of missing values in each variable
tao_imp %>% 
	is.na() %>% 
	colSums()

# Draw a margin plot of air_temp vs sea_surface_temp
tao_imp %>% 
	select(air_temp, sea_surface_temp, air_temp_imp) %>% 
	marginplot(delimiter = "imp")


# Calculate mean air_temp per year
tao %>% 
	group_by(year) %>% 
	summarize(average_air_temp = mean(air_temp, na.rm = TRUE))

# Hot-deck-impute air_temp in tao by year domain
tao_imp <- hotdeck(tao, variable = "air_temp", domain_var = "year")

# Draw a margin plot of air_temp vs sea_surface_temp
tao_imp %>% 
	select(air_temp, sea_surface_temp, air_temp_imp) %>% 
	marginplot(delimiter = "imp")

# Hot-deck-impute air_temp in tao ordering by sea_surface_temp
tao_imp <- hotdeck(tao, variable = "air_temp", ord_var = "sea_surface_temp")

# Draw a margin plot of air_temp vs sea_surface_temp
tao_imp %>% 
	select(air_temp, sea_surface_temp, air_temp_imp) %>% 
	marginplot(delimiter = "imp")	

#KNN -----------------------------------------------------------------------------
# Impute humidity using 30 neighbors
tao_imp <- kNN(tao, k = 30, variable = "humidity")

# Draw a margin plot of sea_surface_temp vs humidity
tao_imp %>% 
	select(sea_surface_temp, humidity, humidity_imp) %>% 
	marginplot(delimiter = "imp", main = "k = 30")


# Impute humidity using 5 neighbors
tao_imp <- kNN(tao, k = 5, variable = "humidity")

# Draw a margin plot of sea_surface_temp vs humidity
tao_imp %>% 
	select(sea_surface_temp, humidity, humidity_imp) %>% 
	marginplot(delimiter = "imp", main = "k = 5")


# Load the VIM package
library(VIM)

# Impute humidity with kNN using distance-weighted mean
tao_imp <- kNN(tao, 
               k = 5, 
               variable = "humidity", 
               numFun = weighted.mean,
               weightDist = TRUE)

tao_imp %>% 
	select(sea_surface_temp, humidity, humidity_imp) %>% 
	marginplot(delimiter = "imp")





# Get tao variable names sorted by number of NAs
vars_by_NAs <- tao %>% 
  is.na() %>%
  colSums() %>%
  sort(decreasing = FALSE) %>% 
  names()

# Sort tao variables and feed it to kNN imputation
tao_imp <- tao %>% 
  select(vars_by_NAs) %>% 
  kNN()

tao_imp %>% 
	select(sea_surface_temp, humidity, humidity_imp) %>% 
	marginplot(delimiter = "imp")







#chapter 3
# Load the simputation package
library(simputation)

# Impute air_temp and humidity with linear regression
formula <- air_temp + humidity ~ year + latitude + sea_surface_temp
tao_imp <- impute_lm(tao, formula)

# Load the simputation package
library(simputation)

# Impute air_temp and humidity with linear regression
formula <- air_temp + humidity ~ year + latitude + sea_surface_temp
tao_imp <- impute_lm(tao, formula)

# Check the number of missing values per column
tao_imp %>% 
  is.na() %>% 
  colSums()

# Print rows of tao_imp in which air_temp or humidity are still missing 
tao_imp %>% 
  filter(is.na(air_temp) | is.na(humidity))



# Initialize missing values with hot-deck
tao_imp <- hotdeck(tao)

# Create boolean masks for where air_temp and humidity are missing
missing_air_temp <- tao_imp$air_temp_imp
missing_humidity <- tao_imp$humidity_imp

for (i in 1:5) {
  # Set air_temp to NA in places where it was originally missing and re-impute it
  tao_imp$air_temp[missing_air_temp] <- NA
  tao_imp <- impute_lm(tao_imp, air_temp ~ year + latitude + sea_surface_temp + humidity)
  # Set humidity to NA in places where it was originally missing and re-impute it
  tao_imp$humidity[missing_humidity] <- NA
  tao_imp <- impute_lm(tao_imp, humidity ~ year + latitude + sea_surface_temp + air_temp)
}  