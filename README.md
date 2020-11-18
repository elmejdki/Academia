# Academia

**This is a capstone project required by [Microverse](https://www.microverse.org/), after finishing a big section of a technical curriculum related to Rails, they have choose this project for me to prove my technical knowledge, you can find the requirement [here](https://www.notion.so/Twitter-redesign-f8a8d48453d54d1a949bb0ceab4c8718)**

> Academia is the most efficient application that you can add to your school to keep your students updated with you school's news, and prevent them from wasting time on social media platforms, instead of that they can use Academia to contact each other and share the latest news about there class and school, in order to use the platform you will need a proper sign up with an email, avatar and cover picture. when you log in you will get redirected to the home page where you can see your own and your following posts at any moment you can click on a user profile image or name to get redirected to his profile if you want to start a conversation with him you will need to click on the message icon next to his profile image.

## Project Presentation Video
[![Video Screeshot](https://user-images.githubusercontent.com/34653764/86858370-6fc63e80-c0b8-11ea-843d-95dd6d3a7d85.png)](https://www.loom.com/share/d731c98d7a0a4fe198fb9a7a7275ee77)


## Features

- A user can sign up and log in using his email and password.
- A user can share his own posts on the home page or profile page
- A user can remove and edit his own posts
- A user can comment on posts
- A user can remove his own comments
- A user can like and dislike a post
- A user can visit his own profile page and other users profile page
- A user can see who is following other users, and who is he following also.
- A user can follow other users, and also he can be followed by them
- A user can contact other users directly using the messages feature
- A user can edit his own information



## Built With

- Ruby v2.6.5;
- Rails v6.0.3.2;
- Simple Form v5.0.2;
- Redis v4.2.1;
- Devise v4.7.2;
- AWS S3 v1.71.1;
- Bootstrap v4.5.0;
- PostgreSQL 1.2.3



## Live Demo

[![heroku image](https://user-images.githubusercontent.com/34653764/84539874-2fa7b200-acec-11ea-845d-850aeebf2b27.png)](https://academiaz.herokuapp.com/)



## Home page

![image-20200708000106050](app/assets/images/home-page.png)



## Profile page

![image-20200708000238060](app/assets/images/profile-page.png)



## Connect page

![image-20200708000620964](app/assets/images/connect-page.png)



## Messages page

![image-20200708000333124](app/assets/images/messages-page.png)



### Prerequisites

Ruby v2.6.5, Rails v6.0.3.2, Postgres: >=9.5

### Setup

install gems with

```
bundle install
```

Setup database with:

```
rails db:create
rails db:migrate
```



## IMPORTANT

**I used S3 AWS service in order to store images. Therefore, I used SECRET KEYS stored in environment variables on my development and production servers.**

- So if you have AWS credentials create a file an application.yml file inside config/ and put this your credentials in it like showing bellow:

```ruby
  development:
    access_key_id: your_access_key_id_goes_here
    secret_access_key: your_secrect_access_key_goes_here
```

### Run Tests

To run tests you can easily go to the root of the project and then run the following command:

```
rspec
```

You can also add your own test cases on the `/spec` directory.

### Usage

Start server with:

```
rails s
```

Then open `http://localhost:3000/` in your browser

# Future Features

- Allow users to search for each other using a search field in the top navbar
- Make the website mobile friendly
- Allow the users to share videos and Photos on there feeds
- Make all of the top navbar links working.

## Author

👤 **Zakariae El Mejdki**

- GitHub: [@elmejdki](https://github.com/elmejdki)
- Twitter: [@zakariaemejdki](https://twitter.com/zakariaemejdki)
- Linkedin: [Zakariae El Mejdki](https://www.linkedin.com/in/zakariaeelmejdki/)

## Credits

Thanks to [Gregoire Vella](https://www.behance.net/gregoirevella) for his awesome [design work ](https://www.behance.net/gallery/14286087/Twitter-Redesign-of-UI-details) that I based my work on.

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](lic.url) licensed.
