const bcrypt = require('bcryptjs');
const xss = require('xss');

const UsersService = {
  hasUserWithEmail(db, email) {
    return db('users')
      .where({ email })
      .first()
      .then(user => !!user)
  },
  insertUser(db, newUser) {
    return db
      .insert(newUser)
      .into('users')
      .returning('*')
  },
  validatePassword(password) {
    const REGEX_UPPER_LOWER_NUMBER_SPECIAL = /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&])[\S]+/
    
    if (password.length < 8) {
      return 'Password must be at least 8 characters'
    }
    if (password.length > 72) {
      return 'Password must be less than 72 characters'
    }
    if (password.startsWith(' ') || password.endsWith(' ')) {
      return 'Password cannot start or end with empty spaces'
    }
    if (!REGEX_UPPER_LOWER_NUMBER_SPECIAL.test(password)) {
      return 'Password must contain one upper case, lower case, number and special character'
    }
    return null
  },
  hashPassword(password) {
    return bcrypt.hash(password, 12)
  },
  serializeUser(user) {
    return {
      email: xss(user.email),
      user_name: xss(user.user_name),
      date_created: new Date(user.date_created),
    }
  },
  getUserBalance(db, user_id) {
    return db('users')
      .select('user_balance')
      .where({user_id})
      .then(res => {
        return res[0]
      })
  }, 
  // Update user balance (On place bet and bet settlement)
  updateUserBalance(db, user_id, user_balance) {
    return db('users')
      .where({user_id})
      .update({user_balance})
      .returning('user_balance') 
  },
  // Reload user balance with 1000
  reloadUserBalance(db, user_id) {
    return this.getUserBalance(db, user_id)
    .then(res => {
      if (res.user_balance <= 0 ) {
        return this.updateUserBalance(db, user_id, 1000)
        .then(newBalance => newBalance[0])
      } else return res.user_balance
    })
  }
};

module.exports = UsersService;
