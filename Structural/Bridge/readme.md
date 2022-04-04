# Паттерн Мост (Bridge) на Swift

> Это структурный паттерн проектирования, который разделяет абстракцию и реализацию,
> позволяя изменять их независимо друг от друга

![bridge pattern image](https://sourcemaking.com/files/v2/content/patterns/Bridge_example.png)

Если вы работали с tableView, то скорее всего, вы уже знакомы с паттерном Bridge.
В Swift передача данных в tableView с помощью dataSource реализована именно посредством данного паттерна.

В текущем примере Bridge реализован для управления DayPicker'ом.

