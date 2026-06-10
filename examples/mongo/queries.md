```js
db.songs.find( { lyrics_url: { $not: {  $regex: /lyricstranslate/ } } } )
```