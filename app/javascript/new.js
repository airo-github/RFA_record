// DOMが読み込まれたら処理が走る
document.addEventListener('DOMContentLoaded', () => {
  // csrf-tokenを取得
  const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  // LIFF_ID を定数定義
  const LIFF_ID = '2000543973-n3q2O64Y';
  // LIFF_IDを使ってLIFFの初期化
  liff
    .init({
      liffId: LIFF_ID,
      // 他のブラウザで開いたときは初期化と一緒にログインもさせるオプション
      withLoginOnExternalBrowser: true
    })
  // 初期化後の処理の設定
  liff
    .ready.then(() => {
      if (!liff.isLoggedIn()) {
        liff.login();
      } else {
        liff.getProfile().then(profile => {
          const idToken = liff.getIDToken()
          const name = profile.displayName
          const body = `idToken=${idToken}&name=${name}`
          const request = new Request('/user', {
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
              'X-CSRF-Token': token
            },
            method: 'POST',
            body: body
          });

          fetch(request)
            .then(response => response.json())
            .then(data => {
              data_id = data
            })
            .then(() => {
              window.location = '/profile'
            })
        })
      }
    })
})


