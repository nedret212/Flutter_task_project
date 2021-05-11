# Flutter Task Project

Flutter üzerinde geliştirdiğim 2019 sezonuna ait bir Premier League Fikstür uygulamasıdır.

- Proje üzerinden sezona ait puan durumu görülebilir.
- "Get Fixtures" ile 38 haftalık fikstür takvimi hafta - hafta görüntülenebilir.

## Temeller

- Mimari olarak MVVM kullanılmıştır.
- Light/Dark olmak üzere iki farklı tema türü bulunmaktadır.
- Animasyonlar için Flutter kütüphanesinde bulunan "Animated Opacity" widget'ı kullanılmıştır.

## Eklentiler
- Api-Sports : https://api-sports.io/  Uygulama üzerinde kullandığım rest Api servisi
- State management ve model yapısında kullanılmak üzere "Provider" kullanıldı.
- ViewModel katmanında "Mobx" kullanıldı.
- Network modülü olarak "Dio" kullanıldı.
- Cache yapısı için "Shared Preferences" kullanıldı.
- Auto generated .g uzantılı dosyaların üretimi için "Build Runner" eklentisi kullanıldı.

