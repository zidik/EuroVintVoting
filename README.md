# EuroVintVoting
This is a system for managing a SMS-voting and collecting SMS-votes. It relies on [Twilio Programmable-SMS](https://www.twilio.com/sms) for receiving the SMS-votes. The application stores the received votes and provides aggregated data about the results of the votings. It is written in Ruby and uses Ruby on Rails web application framework.

## Eurovint
EuroVint is a series of eurovision-inspired events held in Põlva and Tartu, Estonia by [E STuudio Youth Choir](http://noortekoor.estuudio.ee/&lang=eng). It is a 2 hour concert / competition with 18 performances and ends with voting where the visitors (about 400 to 800 people) should be able vote for their favourite performance by sending an SMS to the voting system. 

The system was successfully used on 26 December 2016 on 2 concerts in Põlva and again on 12 February 2017 in Tartu. The backend was hosted on Heroku: [EurovintVoting](https://eurovint-voting.herokuapp.com)

