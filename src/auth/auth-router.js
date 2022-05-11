const express = require('express')
const AuthService = require('./auth-service')

const authRouter = express.Router()
const jsonBodyParser = express.json()
// Validate user credentials and create auth token
authRouter
  .post('/login', jsonBodyParser, (req, res, next) => {
    const { email, password } = req.body
    const loginUser = { email, password }

    for (const [key, value] of Object.entries(loginUser))
      if (value == null)
        return res.status(400).json({
          error: `Missing '${key}' in request body`
        })

    AuthService.getUserWithEmail(
      req.app.get('db'),
      loginUser.email
    )
      .then(user => {
        if (!user)
          return res.status(400).json({
            error: 'Incorrect email or password',
          })

        return AuthService.comparePasswords(loginUser.password, user.password)
          .then(compareMatch => {
            if (!compareMatch)
              return res.status(400).json({
                error: 'Incorrect email or password',
              })

            const sub = user.email
            const payload = { email: user.email, password: user.password}
            res.send({
              authToken: AuthService.createJwt(sub, payload),
              user_balance: user.user_balance,
            })
          })
      })
      .catch(next)
  })

module.exports = authRouter
