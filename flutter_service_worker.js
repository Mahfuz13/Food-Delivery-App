'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "7179218449f34871b1fc572ab4180ce2",
"assets/AssetManifest.bin.json": "6bc3d39a2183f417dc5ece9da523748b",
"assets/AssetManifest.json": "edfb531b42617da6867cb22c19632cf2",
"assets/assets/app_image_1.png": "7ce1a21cebcac352966e7583f71e6583",
"assets/assets/app_image_2.png": "231788f54844e535e1a76fad435b239d",
"assets/assets/app_image_3.png": "1fe7daca803de5a2c2d27676bb07ac63",
"assets/assets/app_logo.png": "21488ab9f3c50f83302e6e327374ee97",
"assets/assets/burger_popular_1.png": "0337746b6ef42eaa59250022a1e305c1",
"assets/assets/burger_popular_2.png": "4fd7f9b1c4750ae8de87d32071a31cfa",
"assets/assets/burger_popular_3.png": "f345db76bf28e3e47704fe273442e93d",
"assets/assets/burger_popular_4.png": "60651f890dcde90b540fae7cb9fb7a81",
"assets/assets/burger_popular_5.png": "0909af3e36b77196a7503202eb158bb7",
"assets/assets/burger_special_1.png": "f8bb17b7e1947f2ca9a41dc99223e9f8",
"assets/assets/burger_special_2.png": "23ed44fd1bc0d70deb326adb568e0dd2",
"assets/assets/burger_special_3.png": "76ae28484544e9101ad92490e7558eaf",
"assets/assets/burger_special_4.png": "d9eede5d90090749151ff82f7167d39c",
"assets/assets/empty_cart.png": "cc8e8f66935d098e7b5579f033dbe3b9",
"assets/assets/facebook_logo.png": "2e5d24e395f3fb0a6145fc549f495872",
"assets/assets/fruit_1.png": "066fda2cb84ee85e147445436013ec32",
"assets/assets/fruit_10.png": "fabf1fd42200e920fe6eec0befdfe35a",
"assets/assets/fruit_2.png": "f8d49466e5522839a37f60eb58ce4c7b",
"assets/assets/fruit_3.png": "e2f7520161fc938ce7e9613a2626fda0",
"assets/assets/fruit_4.png": "569fac36419c9fc10bc1c454b948e326",
"assets/assets/fruit_5.png": "a7a5d2635c2f938a5c9d68a0a39d7a58",
"assets/assets/fruit_6.png": "58ada0fe337b958891e99e9fdf8a0618",
"assets/assets/fruit_7.png": "861a608b8fc8976b58964b09b4906474",
"assets/assets/fruit_8.png": "c51444076940c173be4f593e5a26e3a3",
"assets/assets/fruit_9.png": "62adb48350fe78c883b59376e1ead62f",
"assets/assets/google_logo.png": "ddf2d0f1d682ed732d7549b8e2258c35",
"assets/assets/home_image_1.png": "ea2713c02374fd5cfc379e32c69fe4b6",
"assets/assets/home_image_2.png": "bf8f00a166b4ce2624931c202cb7aec4",
"assets/assets/kitchen_1.png": "7543ee78e7f57dfa8de7d16bf8a81209",
"assets/assets/kitchen_2.png": "0f12b05ec7573f3030ba66f7774b82b3",
"assets/assets/kitchen_3.png": "33e4335f69a4316724b16b97c56c5ef8",
"assets/assets/kitchen_4.png": "99be2a6671c50b98e9950d49b4491d77",
"assets/assets/kitchen_5.png": "7b3e6fa8a151bfe9568abd7d4911c486",
"assets/assets/kitchen_6.png": "2de5674b920b55c38e21af3632fd4726",
"assets/assets/kitchen_7.png": "694b2d6f87401ab4b97be39287e5001d",
"assets/assets/linkedin_logo.png": "6f1d433a4ab15b0d8fefa62acf5e6f64",
"assets/assets/master_card.png": "96ab171716d237d71447c6d7dad96c4c",
"assets/assets/no_notifications.png": "d717a2b4bf32ef03a2ccf022119878c8",
"assets/assets/onboarding_1.png": "2666f47137a59b849d27c038b32fa760",
"assets/assets/onboarding_2.png": "ce26c0e079b7b1fe7f05eb2d4c758772",
"assets/assets/onboarding_3.png": "954846cca2fdad8cfe35dfeaf817a395",
"assets/assets/order_successful.png": "d9afd52176151fb1747e4cfd6cad6cc4",
"assets/assets/paypal.png": "d5e7df2460fd6ccb63726dd3eac8b9ab",
"assets/assets/pizza_popular_1.png": "6b010255801e4d1b2e8a6654336194a5",
"assets/assets/pizza_popular_2.png": "e11722e21d632d3fef9fe890229d4dba",
"assets/assets/pizza_popular_3.png": "d232a1e6e64ce0dff1b05fb372e31747",
"assets/assets/pizza_popular_4.png": "58f92d0e74e84bfa9688c7b84add7105",
"assets/assets/pizza_popular_5.png": "3872335d0f16c6675f7b3896bd48d179",
"assets/assets/pizza_special_1.png": "b46a38893d15d2a211b722318ad20043",
"assets/assets/pizza_special_2.png": "656d8f755efc7d5679f5dd313d6fc24b",
"assets/assets/pizza_special_3.png": "647ff5193c2b3992eecc232e75d32e81",
"assets/assets/pizza_special_4.png": "c83c7f2ea333cca50b006e8fac6c24e1",
"assets/assets/premium_1.png": "82992336d55f63fc24cf390d37ac2898",
"assets/assets/premium_2.png": "d62653056c5246b800f4f3dd56dad35b",
"assets/assets/premium_3.png": "bf8efb2848497768ce3b128c5a1b174b",
"assets/assets/premium_4.png": "ac08051cbb2382900f56aec20c5ea6aa",
"assets/assets/sandwich_popular_1.png": "68d3fa7c6633baad661b2cd0fce47ef7",
"assets/assets/sandwich_popular_2.png": "3e2bd3d1386a8a61d6bcf380bbe60442",
"assets/assets/sandwich_popular_3.png": "be46804e4886a9f8c250b07bfa4d70af",
"assets/assets/sandwich_popular_4.png": "0d453469f0fa07c1352358fc3f101738",
"assets/assets/sandwich_popular_5.png": "3d65c050cc0a57d6a85504a6bfb2d9bb",
"assets/assets/sandwich_special_1.png": "9a6109f24f39d5277d23d58c6feb8923",
"assets/assets/sandwich_special_2.png": "8a64f72ce5bb814200cb3c161cfce9fe",
"assets/assets/sandwich_special_3.png": "ef6713299f2cc2f4967fb858f4b0998f",
"assets/assets/sandwich_special_4.png": "012e31d5d5fb62c157e05f29a75f8545",
"assets/assets/user_profile.png": "589501432a5e3fa28b380ae1a890425e",
"assets/assets/vegetable_1.png": "1282333c13f89f38b03be10edab874fe",
"assets/assets/vegetable_10.png": "e25289d311834cd22ed9608d04632d18",
"assets/assets/vegetable_2.png": "d5a200fc43f8a50a60dc699d94c4c591",
"assets/assets/vegetable_3.png": "4c7a33d37012ca9da520cfc12a471740",
"assets/assets/vegetable_4.png": "2ea4966477ecb1f13dff451a15ac75fa",
"assets/assets/vegetable_5.png": "a37d7124fa2b8efad51b98611ae1a601",
"assets/assets/vegetable_6.png": "2cca9ab3922ff54d70469450a6a46a23",
"assets/assets/vegetable_7.png": "5d90b5b20c9f0beaf7c1cd3558c9c9aa",
"assets/assets/vegetable_8.png": "ca95d255a41844c980ac7624269d9c27",
"assets/assets/vegetable_9.png": "12b2a5e198c0abdcf49e986cf8efdb5f",
"assets/assets/visa.png": "c32634866928b1a2594dfb22a31a5d7a",
"assets/assets/word_app_logo.png": "a5d6bb5d1ca45e1cc91ce9218cefa5bd",
"assets/assets/word_app_logo_food.svg": "d8010ff08cfd3da0e27e927666ed0945",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "ea0df9451c29622750bc4db6471549c3",
"assets/NOTICES": "19d2acc2cbe829e4347929526d3ad0cc",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "96001d07886100fdb6cb90ab5380eeb8",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "04f83c01dded195a11d21c2edf643455",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "08b22e78142e968d1f82dc3731cf4d72",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "916fd799a13647ae03564b8b1414ec1d",
"/": "916fd799a13647ae03564b8b1414ec1d",
"main.dart.js": "fb51d058cbda4bf11c65850c3fe38536",
"manifest.json": "34d7a93a24a9edfdcbc76b9763f73a11",
"version.json": "11e1a177d57c5da2bc6e3a6acc3010f4"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
