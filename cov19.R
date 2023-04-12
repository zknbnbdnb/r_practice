library("ggplot2")
library("dplyr")
library("data.table")

getwd()
data = data.frame(read.csv("D:/R_code/owid-covid-data.csv"))

need_data = select(data, 
                   location,                 # 地区
                   date,                     # 日期
                   total_cases,              # 总病例
                   new_cases,                # 新增病例
                   total_cases_per_million,  # 每一百万人的总病例
                   new_cases_per_million,    # 每一百万人的新增病例
                   total_deaths,             # 总死亡病例
                   new_deaths,               # 新增死亡病例
                   total_deaths_per_million, # 每一百万人的总死亡病例
                   new_deaths_per_million,   # 每一百万人的新增死亡病例
                   total_vaccinations,       # 总疫苗接种数量
                   people_vaccinated,        # 总人类疫苗接种数量
)

america_data = filter(need_data, location == "North America")
china_data = filter(need_data, location == "China")
japan_data = filter(need_data, location == "Japan")
uk_data = filter(need_data, location == "United Kingdom")
india_data = filter(need_data, location == "India")
process1_data = rbind(america_data, china_data, japan_data, uk_data, india_data)
save(process1_data, file = 'D:\\R_code\\shinyWebsite\\data\\statistics\\process1_data.Rdata')

x = as.Date(c('2020-07-22'))

ya = c(range(america_data$total_cases)[-1])
yc = c(range(china_data$total_cases)[-1])
yj = c(range(japan_data$total_cases)[-1])
yu = c(range(uk_data$total_cases)[-1])
yi = c(range(india_data$total_cases)[-1])

labsa = paste(strwrap("Line graph of change in total cases 
                      in the USA over time", 40), collapse = "\n")
labsc = paste(strwrap("Line graph of change in total cases 
                      in the China over time", 40), collapse = "\n")
labsj = paste(strwrap("Line graph of change in total cases 
                      in the Japan over time", 40), collapse = "\n")
labsu = paste(strwrap("Line graph of change in total cases 
                      in the UK over time", 40), collapse = "\n")
labsi = paste(strwrap("Line graph of change in total cases 
                      in the India over time", 40), collapse = "\n")

labelDatea = data.table(x = x, y = ya, labs = labs)
labelDatec = data.table(x = x, y = yc, labs = labs)
labelDatej = data.table(x = x, y = yj, labs = labs)
labelDateu = data.table(x = x, y = yu, labs = labs)
labelDatei = data.table(x = x, y = yi, labs = labs)

ggplot(america_data, aes(as.Date(date, format = "%Y-%m-%d"), total_cases)) + 
  geom_line() + geom_text(aes(x, ya, label = labsa, group = NULL), data = labelDatea)
ggplot(china_data, aes(as.Date(date, format = "%Y-%m-%d"), total_cases)) + 
  geom_line() + geom_text(aes(x, yc, label = labsc, group = NULL), data = labelDatec)
ggplot(japan_data, aes(as.Date(date, format = "%Y-%m-%d"), total_cases)) + 
  geom_line() + geom_text(aes(x, yj, label = labsj, group = NULL), data = labelDatej)
ggplot(uk_data, aes(as.Date(date, format = "%Y-%m-%d"), total_cases)) + 
  geom_line() + geom_text(aes(x, yu, label = labsu, group = NULL), data = labelDateu)
ggplot(india_data, aes(as.Date(date, format = "%Y-%m-%d"), total_cases)) + 
  geom_line() + geom_text(aes(x, yi, label = labsi, group = NULL), data = labelDatei)

ggplot(process_data, aes(as.Date(date, format = "%Y-%m-%d"), total_cases, 
                         color = location, size = total_cases)) + geom_line()
ggplot(process_data, aes(as.Date(date, format = "%Y-%m-%d"), total_cases, 
                         color = location, size = total_cases)) + geom_line() + 
  facet_wrap(~location)


ya = c(range(america_data$new_cases)[-1])
yc = c(15000)
yj = c(100000)
yu = c(200000)
yi = c(range(india_data$new_cases)[-1])

labsa = paste(strwrap("Line graph of change in new cases 
                      in the USA over time", 40), collapse = "\n")
labsc = paste(strwrap("Line graph of change in new cases 
                      in the China over time", 40), collapse = "\n")
labsj = paste(strwrap("Line graph of change in new cases 
                      in the Japan over time", 40), collapse = "\n")
labsu = paste(strwrap("Line graph of change in new cases 
                      in the UK over time", 40), collapse = "\n")
labsi = paste(strwrap("Line graph of change in new cases 
                      in the India over time", 40), collapse = "\n")

labelDatea = data.table(x = x, y = ya, labs = labs)
labelDatec = data.table(x = x, y = yc, labs = labs)
labelDatej = data.table(x = x, y = yj, labs = labs)
labelDateu = data.table(x = x, y = yu, labs = labs)
labelDatei = data.table(x = x, y = yi, labs = labs)

ggplot(america_data, aes(as.Date(date, format = "%Y-%m-%d"), new_cases)) + 
  geom_line() + geom_text(aes(x, ya, label = labsa, group = NULL), data = labelDatea)
ggplot(china_data, aes(as.Date(date, format = "%Y-%m-%d"), new_cases)) + 
  geom_line() + geom_text(aes(x, yc, label = labsc, group = NULL), data = labelDatec)
ggplot(japan_data, aes(as.Date(date, format = "%Y-%m-%d"), new_cases)) + 
  geom_line() + geom_text(aes(x, yj, label = labsj, group = NULL), data = labelDatej)
ggplot(uk_data, aes(as.Date(date, format = "%Y-%m-%d"), new_cases)) + 
  geom_line() + geom_text(aes(x, yu, label = labsu, group = NULL), data = labelDateu)
ggplot(india_data, aes(as.Date(date, format = "%Y-%m-%d"), new_cases)) + 
  geom_line() + geom_text(aes(x, yi, label = labsi, group = NULL), data = labelDatei)

ggplot(process_data, aes(as.Date(date, format = "%Y-%m-%d"), new_cases, 
                         color = location)) + geom_line()
ggplot(process_data, aes(as.Date(date, format = "%Y-%m-%d"), new_cases, 
                         color = location)) + geom_line() + 
  facet_wrap(~location)


# ggplot(america_data, aes(as.Date(date, format = "%Y-%m-%d"), total_cases_per_million)) + 
#   geom_line()
# ggplot(china_data, aes(as.Date(date, format = "%Y-%m-%d"), total_cases_per_million)) + 
#   geom_line()
# ggplot(japan_data, aes(as.Date(date, format = "%Y-%m-%d"), total_cases_per_million)) + 
#   geom_line()
# ggplot(uk_data, aes(as.Date(date, format = "%Y-%m-%d"), total_cases_per_million)) + 
#   geom_line()
# ggplot(india_data, aes(as.Date(date, format = "%Y-%m-%d"), total_cases_per_million)) + 
#   geom_line()
# 
# ggplot(process_data, aes(as.Date(date, format = "%Y-%m-%d"), total_cases_per_million, 
#                          color = location, shape = total_cases_per_million)) + geom_line()


ya = c(1000000)
yc = c(2000)
yj = c(20000)
yu = c(150000)
yi = c(500000)

labsa = paste(strwrap("Line graph of change in total deaths 
                      in the USA over time", 40), collapse = "\n")
labsc = paste(strwrap("Line graph of change in total deaths 
                      in the China over time", 40), collapse = "\n")
labsj = paste(strwrap("Line graph of change in total deaths 
                      in the Japan over time", 40), collapse = "\n")
labsu = paste(strwrap("Line graph of change in total deaths 
                      in the UK over time", 40), collapse = "\n")
labsi = paste(strwrap("Line graph of change in total deaths 
                      in the India over time", 40), collapse = "\n")

labelDatea = data.table(x = x, y = ya, labs = labs)
labelDatec = data.table(x = x, y = yc, labs = labs)
labelDatej = data.table(x = x, y = yj, labs = labs)
labelDateu = data.table(x = x, y = yu, labs = labs)
labelDatei = data.table(x = x, y = yi, labs = labs)

ggplot(america_data, aes(as.Date(date, format = "%Y-%m-%d"), total_deaths)) + 
  geom_line() + geom_text(aes(x, ya, label = labsa, group = NULL), data = labelDatea)
ggplot(china_data, aes(as.Date(date, format = "%Y-%m-%d"), total_deaths)) + 
  geom_line() + geom_text(aes(x, yc, label = labsc, group = NULL), data = labelDatec)
ggplot(japan_data, aes(as.Date(date, format = "%Y-%m-%d"), total_deaths)) + 
  geom_line() + geom_text(aes(x, yj, label = labsj, group = NULL), data = labelDatej)
ggplot(uk_data, aes(as.Date(date, format = "%Y-%m-%d"), total_deaths)) + 
  geom_line() + geom_text(aes(x, yu, label = labsu, group = NULL), data = labelDateu)
ggplot(india_data, aes(as.Date(date, format = "%Y-%m-%d"), total_deaths)) + 
  geom_line() + geom_text(aes(x, yi, label = labsi, group = NULL), data = labelDatei)
ggplot(process_data, aes(as.Date(date, format = "%Y-%m-%d"), total_deaths, 
                         color = location, size = total_deaths)) + geom_line()
ggplot(process_data, aes(as.Date(date, format = "%Y-%m-%d"), total_deaths, 
                         color = location, size = total_deaths)) + geom_line() + 
  facet_wrap(~location)
  

ya = c(range(america_data$new_deaths)[-1])
yc = c(1000)
yj = c(300)
yu = c(1500)
yi = c(4000)

labsa = paste(strwrap("Line graph of change in new deaths 
                      in the USA over time", 40), collapse = "\n")
labsc = paste(strwrap("Line graph of change in new deaths 
                      in the China over time", 40), collapse = "\n")
labsj = paste(strwrap("Line graph of change in new deaths 
                      in the Japan over time", 40), collapse = "\n")
labsu = paste(strwrap("Line graph of change in new deaths 
                      in the UK over time", 40), collapse = "\n")
labsi = paste(strwrap("Line graph of change in new deaths 
                      in the India over time", 40), collapse = "\n")

labelDatea = data.table(x = x, y = ya, labs = labs)
labelDatec = data.table(x = x, y = yc, labs = labs)
labelDatej = data.table(x = x, y = yj, labs = labs)
labelDateu = data.table(x = x, y = yu, labs = labs)
labelDatei = data.table(x = x, y = yi, labs = labs)

ggplot(america_data, aes(as.Date(date, format = "%Y-%m-%d"), new_deaths)) + 
  geom_line() + geom_text(aes(x, ya, label = labsa, group = NULL), data = labelDatea)
ggplot(china_data, aes(as.Date(date, format = "%Y-%m-%d"), new_deaths)) + 
  geom_line() + geom_text(aes(x, yc, label = labsc, group = NULL), data = labelDatec)
ggplot(japan_data, aes(as.Date(date, format = "%Y-%m-%d"), new_deaths)) + 
  geom_line() + geom_text(aes(x, yj, label = labsj, group = NULL), data = labelDatej)
ggplot(uk_data, aes(as.Date(date, format = "%Y-%m-%d"), new_deaths)) + 
  geom_line() + geom_text(aes(x, yu, label = labsu, group = NULL), data = labelDateu)
ggplot(india_data, aes(as.Date(date, format = "%Y-%m-%d"), new_deaths)) + 
  geom_line() + geom_text(aes(x, yi, label = labsi, group = NULL), data = labelDatei)

ggplot(process_data, aes(as.Date(date, format = "%Y-%m-%d"), new_deaths, 
                         color = location)) + geom_line()
ggplot(process_data, aes(as.Date(date, format = "%Y-%m-%d"), new_deaths, 
                         color = location)) + geom_line() + facet_wrap(~location)


ya = c(7.5e8)
yc = c(3e9)
yj = c(2e8)
yu = c(1e8)
yi = c(1.5e9)

labsa = paste(strwrap("Line graph of change in total vaccinations 
                      in the USA over time", 40), collapse = "\n")
labsc = paste(strwrap("Line graph of change in total vaccinations 
                      in the China over time", 40), collapse = "\n")
labsj = paste(strwrap("Line graph of change in total vaccinations 
                      in the Japan over time", 40), collapse = "\n")
labsu = paste(strwrap("Line graph of change in total vaccinations 
                      in the UK over time", 40), collapse = "\n")
labsi = paste(strwrap("Line graph of change in total vaccinations 
                      in the India over time", 40), collapse = "\n")

labelDatea = data.table(x = x, y = ya, labs = labs)
labelDatec = data.table(x = x, y = yc, labs = labs)
labelDatej = data.table(x = x, y = yj, labs = labs)
labelDateu = data.table(x = x, y = yu, labs = labs)
labelDatei = data.table(x = x, y = yi, labs = labs)

ggplot(america_data, aes(as.Date(date, format = "%Y-%m-%d"), total_vaccinations)) + 
  geom_line() + geom_text(aes(x, ya, label = labsa, group = NULL), data = labelDatea)
ggplot(china_data, aes(as.Date(date, format = "%Y-%m-%d"), total_vaccinations)) + 
  geom_line() + geom_text(aes(x, yc, label = labsc, group = NULL), data = labelDatec)
ggplot(japan_data, aes(as.Date(date, format = "%Y-%m-%d"), total_vaccinations)) + 
  geom_line() + geom_text(aes(x, yj, label = labsj, group = NULL), data = labelDatej)
ggplot(uk_data, aes(as.Date(date, format = "%Y-%m-%d"), total_vaccinations)) + 
  geom_line() + geom_text(aes(x, yu, label = labsu, group = NULL), data = labelDateu)
ggplot(india_data, aes(as.Date(date, format = "%Y-%m-%d"), total_vaccinations)) + 
  geom_line() + geom_text(aes(x, yi, label = labsi, group = NULL), data = labelDatei)

ggplot(process_data, aes(as.Date(date, format = "%Y-%m-%d"), total_vaccinations, 
                         color = location, size = total_vaccinations)) + geom_line()

ggplot(process_data, aes(as.Date(date, format = "%Y-%m-%d"), total_vaccinations, 
                         color = location, size = total_vaccinations)) + geom_line() + 
  facet_wrap(~location)


# ggplot(america_data, aes(as.Date(date, format = "%Y-%m-%d"), people_vaccinated)) + 
#   geom_line()
# ggplot(china_data, aes(as.Date(date, format = "%Y-%m-%d"), people_vaccinated)) + 
#   geom_line()
# ggplot(japan_data, aes(as.Date(date, format = "%Y-%m-%d"), people_vaccinated)) + 
#   geom_line()
# ggplot(uk_data, aes(as.Date(date, format = "%Y-%m-%d"), people_vaccinated)) + 
#   geom_line()
# ggplot(india_data, aes(as.Date(date, format = "%Y-%m-%d"), people_vaccinated)) + 
#   geom_line()
# ggplot(process_data, aes(as.Date(date, format = "%Y-%m-%d"), people_vaccinated, 
#                          color = location, size = people_vaccinated)) + geom_line()


ya = c(7.5e8)
yc = c(3e9)
yj = c(2e8)
yu = c(1e8)
yi = c(1.5e9)

labsa = paste(strwrap("Line graph of change in total vaccines and total cases 
                      in the USA over time", 40), collapse = "\n")
labsc = paste(strwrap("Line graph of change in total vaccines and total cases 
                      in the China over time", 40), collapse = "\n")
labsj = paste(strwrap("Line graph of change in total vaccines and total cases 
                      in the Japan over time", 40), collapse = "\n")
labsu = paste(strwrap("Line graph of change in total vaccines and total cases 
                      in the UK over time", 40), collapse = "\n")
labsi = paste(strwrap("Line graph of change in total vaccines and total cases 
                      in the India over time", 40), collapse = "\n")

labelDatea = data.table(x = x, y = ya, labs = labs)
labelDatec = data.table(x = x, y = yc, labs = labs)
labelDatej = data.table(x = x, y = yj, labs = labs)
labelDateu = data.table(x = x, y = yu, labs = labs)
labelDatei = data.table(x = x, y = yi, labs = labs)

ggplot() + geom_line(data = america_data, aes(as.Date(date, format = "%Y-%m-%d"), 
                                       total_cases), color = "blue") + 
  geom_line(data = america_data, aes(as.Date(date, format = "%Y-%m-%d"), 
                              total_vaccinations), color = "red") + theme_bw() + 
  geom_text(aes(x, ya, label = labsa, group = NULL), data = labelDatea)

ggplot() + geom_line(data = china_data, aes(as.Date(date, format = "%Y-%m-%d"), 
                                              total_cases), color = "blue") + 
  geom_line(data = china_data, aes(as.Date(date, format = "%Y-%m-%d"), 
                                     total_vaccinations), color = "red") + theme_bw() + 
  geom_text(aes(x, ya, label = labsc, group = NULL), data = labelDatea)

ggplot() + geom_line(data = japan_data, aes(as.Date(date, format = "%Y-%m-%d"), 
                                            total_cases), color = "blue") + 
  geom_line(data = japan_data, aes(as.Date(date, format = "%Y-%m-%d"), 
                                   total_vaccinations), color = "red") + theme_bw() + 
  geom_text(aes(x, ya, label = labsj, group = NULL), data = labelDatea)
   
ggplot() + geom_line(data = uk_data, aes(as.Date(date, format = "%Y-%m-%d"), 
                                              total_cases), color = "blue") + 
  geom_line(data = uk_data, aes(as.Date(date, format = "%Y-%m-%d"), 
                                     total_vaccinations), color = "red") + theme_bw() + 
  geom_text(aes(x, ya, label = labsu, group = NULL), data = labelDatea)

ggplot() + geom_line(data = india_data, aes(as.Date(date, format = "%Y-%m-%d"), 
                                              total_cases), color = "blue") + 
  geom_line(data = india_data, aes(as.Date(date, format = "%Y-%m-%d"), 
                                     total_vaccinations), color = "red") + theme_bw() + 
  geom_text(aes(x, ya, label = labsi, group = NULL), data = labelDatea)




