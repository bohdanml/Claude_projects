import calendar

print ('Вітаю в кадендарі!\n')
#input year
year = int(input('Введіть рік: '))

month = int(input('Введіть номер місяця: '))

print(calendar.month(year,month))

