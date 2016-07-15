var express = require('express');
var router = express.Router();
var crypto = require('crypto');
var User = require('../models/user');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});
router.get('/reg',function (req, res) {
  res.render('reg',{
    title: '用户注册',
  });
});
router.get('/login',function (req, res) {
  res.render('login',{
    title: '用户登录',
  });
});

router.get('/blog', function (req, res) {
  res.render('index',{title : '微博首页'});
});

router.get('/logout',checkLogin);
router.get('/logout',function (req, res) {
  req.session.user = null;
  req.flash('success','退出成功');
  res.redirect('/');
});


router.post('/login',checkNotLogin);
router.post('/login',function (req, res) {
  console.log('password:'+ req.body['password']);
  console.log('username:'+ req.body['username']);
  var md5 = crypto.createHash('md5');
  var password = md5.update(req.body.password).digest('base64');

  var loginUser = new User({
    name: req.body.username,
    password: password,
  });
  User.get(loginUser.name, function (err, user) {
    if(err){
      console.log('err  :'+err);
    }
    if(!user){
      err = 'User does not exists';
      req.flash('error',err);
      return res.redirect('/login');
    }
    if (user.password != password){
      req.flash('error','用户名或者密码错误');
      return res.redirect('/login');
    }
    req.session.user = user;
    req.flash('success',req.session.user.name +'登录成功');
    return res.redirect('/');
  });

});
router.post('/reg',checkNotLogin);
router.post('/reg',function (req, res) {
  console.log('password:'+ req.body['password']);
  console.log('password-repeat:'+req.body['password-repeat']);
  //先做密码判断
  if(req.body['password-repeat'] != req.body['password']){
    req.flash('error','两次输入的密码不一致');
    return res.redirect('/reg');
  }
  //再做post请求
  var md5 = crypto.createHash('md5');
  var password = md5.update(req.body.password).digest('base64');
  
  var newUser = new User({
    name : req.body.username,
    password: password,
  });
  //检查用户名是否已经存在
  User.get(newUser.name, function (err, user) {
    if(user){
      err = 'Username already exists.';
    }
    if(err){
      console.log(err);
      req.flash('error',err);
      return res.redirect('/reg');
    }
    console.log('注册成功');
    //用户名不存在直接注册
    newUser.save(function (err) {
      if(err){
        req.flash('error', '用户已经存在');
        return res.redirect('/reg');
      }
      req.session.user = newUser;
      req.flash('success', req.session.user.name+'注册成功');
      return res.redirect('/');
    });
  });
});

function checkNotLogin(req, res, next) {
  if(req.session.user){
    req.flash('error','用户已经登录');
    return res.redirect('/');
  }
  next();
}

function checkLogin(req, res, next) {
  if(!req.session.user){
    req.flash('error','用户尚未登录')
  }
  next();
}

module.exports = router;
