# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Admin.create(email: ENV["ADMIN_EMAIL"], password: ENV["ADMIN_PASS"])

Gif.create([
  { title: "Thumbs up computer kid",
    url: "http://i.imgur.com/O0sAOY5.gif",
    tag_list: "yes, yup, thumbs up, awesome, computer, technology"
  },
  { title: "Slow nod of approval guy",
    url: "http://i.imgur.com/uf2Mw.gif",
    tag_list: "yes, yup, approve, approved, guy, beard"
  },
  {
    title: "Cat sitting on couch sighs",
    url: "http://giant.gfycat.com/ColorlessFittingBuffalo.gif",
    tag_list: "cat, sigh, couch, sad, depressed"
  },
  {
    title: "Deal With It slip and slide",
    url: "http://i.imgur.com/1q4dL.gif",
    tag_list: "deal with it, slide, beard"
  },
  {
    title: "Emergency space monkey",
    url: "http://i.imgur.com/AAj3HgQ.jpg",
    tag_list: "alert, emergency, monkey, space"
  }
])
