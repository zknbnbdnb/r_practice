library("ggplot2")
library("dplyr")
library("data.table")
library("stringr")

getwd()
data = data.frame(read.csv("D:/R_code/owid-covid-data.csv"))

need_data = select(data, 
                   location,                 # 地区
                   date,                     # 日期
                   new_cases,                # 新增病例
                   new_vaccinations,           # 新增疫苗
)

america_data = filter(need_data, location == "North America")
china_data = filter(need_data, location == "China")
japan_data = filter(need_data, location == "Japan")
uk_data = filter(need_data, location == "United Kingdom")
india_data = filter(need_data, location == "India")

process_data = rbind(america_data, china_data, japan_data, uk_data, india_data)

ggplot(process_data, aes(as.Date(date, format = "%Y-%m-%d"), total_cases, 
                         color = location, size = total_cases)) + geom_line()

process_data[is.na(process_data)] = 0

for(i in 1:nrow(process_data)){
  tmp1 = str_sub(process_data[i, 'date'], start=1, end=4)
  tmp2 = str_sub(process_data[i, 'date'], start=6, end=7)
  process_data[i, 'date'] = str_c(tmp1,tmp2)
  integer(process_data[i, 'date'])
  integer(process_data[i, 'new_cases'])
  integer(process_data[i, 'new_vaccinations'])
  if(process_data[i, 'new_cases'] > process_data[i, 'new_vaccinations']){
    process_data[i, 'new_vaccinations'] = 'Bad'
  }else {
    process_data[i, 'new_vaccinations'] = 'Good'
  }
}
names(process_data) = c('location', 'date', 'new_cases', 'indicators')
fin_data = aggregate(x=process_data$new_cases, by=list(process_data$location, process_data$date, process_data$indicators), FUN=sum)
names(fin_data) = c('location', 'date', 'indicators', 'new_cases')








