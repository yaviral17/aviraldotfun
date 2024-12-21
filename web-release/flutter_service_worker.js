'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "a2a4df450501979075b29f5359accd0e",
"assets/AssetManifest.bin.json": "b1fb5112bba11475423717ed21ae41f2",
"assets/AssetManifest.json": "d2e0ff26d08f717119a8bbb785149836",
"assets/assets/animations/animation.json": "2ad966268394b8b0b92dcd3d01cf06bb",
"assets/assets/animations/Arrow%2520Receive.json": "44be2a586f5300642cef84ee7a0565bf",
"assets/assets/animations/Arrow%2520Send.json": "07928c89ee7eb92ade91d76599dfd82b",
"assets/assets/animations/lock_animation.json": "9e1b2ed81f773821952beae4ed51ffd1",
"assets/assets/animations/request%2520sent.json": "667b54be9323974c3b7efcec5b235ad0",
"assets/assets/animations/Scene%25201.json": "7d07dfac0ec7af58893789e41d2159ad",
"assets/assets/animations/Scene%252010.json": "f89fc9a3b7add0b58555416647866241",
"assets/assets/animations/Scene%252011.json": "18fa83f0566e74b5f0cb3b229a996cab",
"assets/assets/animations/Scene%252012.json": "44f757291a0a4c02ec034df5fd59ab54",
"assets/assets/animations/Scene%252013.json": "b72de9bfcf7688de216a71be8e25c89c",
"assets/assets/animations/Scene%252014.json": "257ff9eba46e0ae5affe0f251047c2cd",
"assets/assets/animations/Scene%252015.json": "e6dede90f169d06410e4c9638484fb13",
"assets/assets/animations/Scene%252016.json": "9e545eba01cd604586658ac2093fc8f9",
"assets/assets/animations/Scene%252017.json": "7187c69da5363161243c650e95d1f84b",
"assets/assets/animations/Scene%252018.json": "33699f2a91094b315308192a1e3c0aee",
"assets/assets/animations/Scene%252019.json": "3b177c9e034513988554e4d0b7d6c4c4",
"assets/assets/animations/Scene%25202.json": "d4b367e5925f1774fb05b751c37feae1",
"assets/assets/animations/Scene%252020.json": "c84a58ba395ef943f652fa2977eba90b",
"assets/assets/animations/Scene%25203.json": "3f8c6422f1f757ad11c256b0120984a7",
"assets/assets/animations/Scene%25204.json": "b6c733f8dad3cde85262548665a35ade",
"assets/assets/animations/Scene%25205.json": "ae2baea93811c4763280f9430782dfee",
"assets/assets/animations/Scene%25206.json": "57d6ee01280fe316161cb0be5ca611a5",
"assets/assets/animations/Scene%25207.json": "eac86ad7bf1769275d99bcf5cde67fcd",
"assets/assets/animations/Scene%25208.json": "90b3ff1355fef02d4e5f6e4c991c74d1",
"assets/assets/animations/Scene%25209.json": "c04f6f65d4f98172a6f1447a34070363",
"assets/assets/fonts/Manjari/Manjari-Bold.ttf": "eb5269bb19d8c99bb99851a7c299db61",
"assets/assets/fonts/Manjari/Manjari-Regular.ttf": "43ce5b696c5f9d3e43df1318865e105c",
"assets/assets/fonts/Manjari/Manjari-Thin.ttf": "3b13cf358a71d97c1d5bb2ed52b2fbb6",
"assets/assets/fonts/Montserrat/Montserrat-Black.ttf": "cce7ff8c1d7999f907b6760fbe75d99d",
"assets/assets/fonts/Montserrat/Montserrat-Bold.ttf": "ed86af2ed5bbaf879e9f2ec2e2eac929",
"assets/assets/fonts/Montserrat/Montserrat-ExtraBold.ttf": "9e07cac927a9b4d955e2138bf6136d6a",
"assets/assets/fonts/Montserrat/Montserrat-ExtraLight.ttf": "a7fe50578d9aa3966c925cb9722db03a",
"assets/assets/fonts/Montserrat/Montserrat-Light.ttf": "94fbe93542f684134cad1d775947ca92",
"assets/assets/fonts/Montserrat/Montserrat-Medium.ttf": "bdb7ba651b7bdcda6ce527b3b6705334",
"assets/assets/fonts/Montserrat/Montserrat-Regular.ttf": "5e077c15f6e1d334dd4e9be62b28ac75",
"assets/assets/fonts/Montserrat/Montserrat-SemiBold.ttf": "cc10461cb5e0a6f2621c7179f4d6de17",
"assets/assets/fonts/Montserrat/Montserrat-Thin.ttf": "b3638b16904211d1d24d04ce53810c4d",
"assets/assets/icons/clock.svg": "b9ff6dd2862543c3b9743a455bbffd82",
"assets/assets/icons/flutter.svg": "356b8423fb4c37e3babe292a9e03c975",
"assets/assets/icons/github.png": "ec3a60c8c6539a07eb70b52f6737ea6e",
"assets/assets/icons/github.svg": "76d344f08412543c74ccd1fb2493d607",
"assets/assets/icons/linkedin.png": "30c453b7f5fbdb09ea0cb42a5dc7a6e5",
"assets/assets/icons/linkedin.svg": "a119dc13891e0fafc92ba1176712d3cc",
"assets/assets/icons/matrix.png": "9127a90a234090cbf8815bb0502fd873",
"assets/assets/icons/playstore.png": "3f9848c4e3a973d4fe098cf8e39b5b6e",
"assets/assets/icons/playstore.svg": "aaada2a103792cf75a90a9c39e766725",
"assets/assets/icons/topMate.png": "8f85d44acfac5e1e6f6e43f1ae2f88aa",
"assets/assets/icons/twitter.svg": "8f662cde3e6a9aca24b77c1639d9423e",
"assets/assets/icons/x.png": "5c848097c9f308565da829ac0fa645e1",
"assets/assets/icons/youtube.png": "1f22ea146a25be7785517263476e46e9",
"assets/assets/icons/youtube.svg": "3eb182663fd1181f048705dedec45580",
"assets/assets/images/1725035925815.jpg": "853887c9cc97b529ddbbb5438003e30f",
"assets/assets/images/3DProfile/1.png": "8588eddd30563a2e88fcd15a10e67143",
"assets/assets/images/3DProfile/10.png": "116df345d5d67d65db8b95289eb323c2",
"assets/assets/images/3DProfile/11.png": "90fa2461ce61bc59d5b3936b412d798b",
"assets/assets/images/3DProfile/12.png": "f90853eb8cd671c69691e146062c53a9",
"assets/assets/images/3DProfile/13.png": "5c7e8e775a80a306a922033643712a40",
"assets/assets/images/3DProfile/14.png": "7b3af8dcd8193fab1d7e14c54e10b8eb",
"assets/assets/images/3DProfile/15.png": "818d38201f5134f8e700ffb17030eb4c",
"assets/assets/images/3DProfile/16.png": "92ccd7a09af125cb29688f3e4b6a8a4e",
"assets/assets/images/3DProfile/17.png": "f7b34151ed56a04556a62f2f1efc8a5b",
"assets/assets/images/3DProfile/18.png": "7c55d12d7dd24cf670632728493bacfe",
"assets/assets/images/3DProfile/19.png": "22c897d6bb92f29101a8bbe5a0bebca2",
"assets/assets/images/3DProfile/2.png": "0e1f46d7da405011fb989685d136ad51",
"assets/assets/images/3DProfile/20.png": "6edbafee8c05fe13e54180b1a415c435",
"assets/assets/images/3DProfile/21.png": "5fbd42badc76e19280822f803469daae",
"assets/assets/images/3DProfile/22.png": "61b35dd92ccfbe3930d599a4a0a2420f",
"assets/assets/images/3DProfile/23.png": "17b551bc14ffc889feb4ad679bb13ec3",
"assets/assets/images/3DProfile/24.png": "31a65702445610ee144a48aee5464474",
"assets/assets/images/3DProfile/25.png": "784ac5ebcc962f8ee60456f5d20ad8a1",
"assets/assets/images/3DProfile/26.png": "c5ec3a3f5f66b2df1a3184fe1a89a9db",
"assets/assets/images/3DProfile/27.png": "71df19305c50cbd30089c2687f3e8cb4",
"assets/assets/images/3DProfile/28.png": "b2d0a6d6cb512d88ff52f8c92f98880f",
"assets/assets/images/3DProfile/29.png": "4f285fe26fbeee360464d12c409f929b",
"assets/assets/images/3DProfile/3.png": "9b09c301ea9f2edfad95442735a8bf67",
"assets/assets/images/3DProfile/30.png": "dc265e5e295a50bf1981fc430abf90d0",
"assets/assets/images/3DProfile/4.png": "c90e575b7d058c711fef51c0aa15531d",
"assets/assets/images/3DProfile/5.png": "9aeb58906ae2c0d3e724315416d9ffad",
"assets/assets/images/3DProfile/6.png": "f377f76760f7081b3db8ff4eb34d7c0c",
"assets/assets/images/3DProfile/7.png": "e6eff581349bd2691b7d138cd61ac10b",
"assets/assets/images/3DProfile/8.png": "0738c0bcab501c97be79f5d949450af7",
"assets/assets/images/3DProfile/9.png": "34d29185f2cb2529a58dd3c4841dfa98",
"assets/assets/images/add_token_account_info_card_bg.png": "e9211c971324bff9b4ce18d118eefa51",
"assets/assets/images/balance_card_bg.png": "75847da1f79c076d6cf64a839d9c0ded",
"assets/assets/images/cloudRed.svg": "bda20cdd4888404719f432377a3665f9",
"assets/assets/images/cloudyBlue.svg": "e9d5e246793cd42bc01f6809d826583d",
"assets/assets/images/coming_soon.png": "ea42c757d655a830333308162de941fa",
"assets/assets/images/electricity.png": "2baff5990aaee5086bfbc8a0af29a249",
"assets/assets/images/funds_icon.png": "041c31a874819a85bfe125acfbd425e4",
"assets/assets/images/hello.png": "d1f4810517a11de2a7abb69c1cf416c4",
"assets/assets/images/ic_lock.png": "6d12253db084949877b8313623a5900a",
"assets/assets/images/ic_payme.png": "8f28c190dadd106d4777f2b32980951e",
"assets/assets/images/input_pin_logo.png": "2e7adbf2716e730839f74b3ab40e1197",
"assets/assets/images/introductionsfirst.png": "a525e3539f20804a765d40b4aa4837fd",
"assets/assets/images/let%25E2%2580%2599s%2520get%2520your%2520phone%2520number.png": "af5dd8509d3ae3f93486c1e2e6db6812",
"assets/assets/images/lock_icon.png": "0a7015ebf586b6764fda7b302f0913d4",
"assets/assets/images/logo.png": "486dca27c1f705e725b9348b2c27ed1a",
"assets/assets/images/logo_icon.png": "8f28c190dadd106d4777f2b32980951e",
"assets/assets/images/logo_text_dark.png": "d535b2585fb36e409da2404c295a4b0d",
"assets/assets/images/logo_text_light.png": "e27a99e5c3873c7f59bd5c04ce5fd663",
"assets/assets/images/mobile_recharge.png": "427c9acc5cf37967dbdaa5adba7da61b",
"assets/assets/images/pfp_dialog_capture.png": "dc0883e1dbfb9c14cf87c4436a68ecc7",
"assets/assets/images/pfp_dialog_gallery.png": "07c0aaf42f10295244f7107ff8866261",
"assets/assets/images/pfp_dialog_go_back.png": "7e5304fb7aa6aa4f0553bc5ea19205aa",
"assets/assets/images/pfp_placeholder.png": "1cd588b28c652e6fbcb21980e1d54db6",
"assets/assets/images/qr_icon.png": "2f7ca40987daca8d02d6e5db3be7b2c3",
"assets/assets/images/recieve_icon.png": "0d7965e0113c5fb0b3107da2d0ffd58a",
"assets/assets/images/recieve_icon_.png": "ade0ce482384e9353c1960136746dbe3",
"assets/assets/images/transfer_icon.png": "6f57e63e98b2f7d73c52fb4998426a92",
"assets/assets/images/transfer_icon_.png": "7372da8dd7fb05fb592468e8d6e16c54",
"assets/assets/images/unlock_balance.png": "771ad0ff9bde1cd03f3260e30100fe1c",
"assets/assets/images/whatshouldwecallyou%2520_.png": "9ec7e9b5ac495f7a1cd8ff00ae3825f0",
"assets/assets/images/wifi.png": "9aef24e798b78e4b89f2422cfc7cb148",
"assets/assets/images/yaviral17.svg": "2b0d9c3ad1665204df5e7911fbdffaa6",
"assets/assets/rive/rain.riv": "91a917f7343f7ac4523955e4ac8ca7f6",
"assets/FontManifest.json": "8e7cd51a1855768e9b62d34e5b265911",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/NOTICES": "701ab637a19e4255ac85d6e67bc34989",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "b93248a553f9e8bc17f1065929d5934b",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "4769f3245a24c1fa9965f113ea85ec2a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/packages/iconsax/lib/assets/fonts/iconsax.ttf": "071d77779414a409552e0584dcbfd03d",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "21145511f623e6467914750b5529d92f",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "9c2d0c8fdc46417aa1fa0f1169fe320b",
"/": "9c2d0c8fdc46417aa1fa0f1169fe320b",
"main.dart.js": "0cac50075ced5df46ac5b388def68d34",
"manifest.json": "661564c3a4836d08f97499bfec9fb631",
"version.json": "7227c940406b8524dde694ccc49051e7"};
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
