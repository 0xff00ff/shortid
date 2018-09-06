ShortId creates amazingly short non-sequential url-friendly unique ids.  Perfect for url shorteners, MongoDB and Redis ids, and any other id users might see.

 * By default 7-14 url-friendly characters: `A-Z`, `a-z`, `0-9`, `_-`
 * Supports custom seeds, custom alphabet.
 * Can generate `any` number of ids without duplicates, even millions per day.
 * Good replacement for Mongo ID/Mongoose ID.
 * Includes tests.

ShortId does not generate cryptographically secure ids, so don't rely on it to make IDs which are impossible to guess.


### Usage

```dart
import 'package:shortid/shortid.dart';

console.log(shortid.generate());
// PPBqWA9
```


---------------------------------------

#### `shortid.generate()`

__Returns__ `string` non-sequential unique id.

__Example__

```js
users.insert({
  _id: shortid.generate(),
  name: '...',
  email: '...'
});
```

---------------------------------------

#### `shortid.characters(string)`

__Default:__ `'0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_'`

__Returns__ new alphabet as a `string`

__Recommendation:__ If you don't like _ or -, you can to set new characters to use.

__Optional__

Change the characters used.

You must provide a string of all 64 unique characters. Order is not important.

The default characters provided were selected because they are url safe.

__Example__

```dart
// use $ and @ instead of - and _
shortid.characters('0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ$@');
```

```js
// any 64 unicode characters work, but I wouldn't recommend this.
shortid.characters('ⒶⒷⒸⒹⒺⒻⒼⒽⒾⒿⓀⓁⓂⓃⓄⓅⓆⓇⓈⓉⓊⓋⓌⓍⓎⓏⓐⓑⓒⓓⓔⓕⓖⓗⓘⓙⓚⓛⓜⓝⓞⓟⓠⓡⓢⓣⓤⓥⓦⓧⓨⓩ①②③④⑤⑥⑦⑧⑨⑩⑪⑫');
```

---------------------------------------

#### `shortid.seed(integer)`

__Default:__ `1`

__Recommendation:__ You typically won't want to change this.

__Optional__

Choose a unique value that will seed the random number generator so users won't be able to figure out the pattern of the unique ids. Call it just once in your application before using `shortId` and always use the same value in your application.

Most developers won't need to use this, it's mainly for testing ShortId.

If you are worried about users somehow decrypting the id then use it as a secret value for increased encryption.

__Example__

```dart
shortid.seed(1000);
```