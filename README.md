# USER API

NOTE: In order to get a better management with the user password, I've installed Devise

1. To sign up new user:
```
curl --location --request POST 'localhost:3000/users' \
--form 'user[email]=schusterann11@gmail.com' \
--form 'user[password]=123456' \
--form 'user[password_confirmation]=123456' \
--form 'user[first_name]=steph1' \
--form 'user[last_name]=schustermann'

```

2. To get all the created users:

```
curl --location --request GET 'localhost:3000/users'

```

3. To get specific user with id = 1:

```
curl --location --request GET 'localhost:3000/users/1'

```

4. To sign in user:

```
curl --location --request POST 'localhost:3000/sign_in' \
--form 'sign_in[email]=schusteann11@gmail.com' \
--form 'sign_in[password]=123456'

```

You will get with the response the following cookie:
```'Cookie: AUTH-TOKEN=sjKfAAk4HYxnwpVHf8wAsCtA' ```

5. To sign out user:

```
curl --location --request DELETE 'localhost:3000/sign_out' \
--header 'Cookie: AUTH-TOKEN=sjKfAAk4HYxnwpVHf8wAsCtA'

```