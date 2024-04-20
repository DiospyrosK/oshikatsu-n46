const category_select = () => {
  // 親カテゴリーのセレクトボックスが存在するかを確認
  const postCategorySelect = document.getElementById('post_category_id');
  if (postCategorySelect) {
    // 存在する場合、変更イベントリスナーを追加
    postCategorySelect.addEventListener('change', function() {
      updateSubcategoriesAndCategoryId(this.value, 'child');
    });
  }

  // イベント委譲を使用して、子カテゴリーと孫カテゴリーのセレクトボックスの選択が変更された場合を捕捉
  document.addEventListener('change', function(e) {
    if (e.target.matches('#category-child')) {
      updateSubcategoriesAndCategoryId(e.target.value, 'grandchild');
    } else if (e.target.matches('#category-grandchild')) {
      updateCategoryId(e.target.value);
    }
  });

  // ジャンルIDを更新し、必要に応じて子カテゴリーまたは孫カテゴリーをロード
  function updateSubcategoriesAndCategoryId(categoryId, level) {
    updateCategoryId(categoryId); // 選択されたジャンルIDで隠しフィールドを更新
    updateSubcategories(categoryId, level); // 子または孫カテゴリーをロード
  }

  // 選択されたジャンルIDで隠しフィールドを更新
  function updateCategoryId(categoryId) {
    document.getElementById('selected_category_id').value = categoryId;
  }

  // 子または孫カテゴリーをロードする処理（以前と同様）

  function updateSubcategories(parentId, level) {
    fetch(`/categories/${parentId}/children`)
      .then(response => response.json())
      .then(data => {
        const container = document.querySelector(`#category-${level}-container`);
        if (data.length > 0) {
          let options = `<select id="category-${level}" class="select-box"><option value="">選択してください</option>`;
          data.forEach((category) => {
            options += `<option value="${category.id}">${category.name}</option>`;
          });
          options += '</select>';
          container.innerHTML = options;
          container.style.display = 'block';
        } else {
          container.innerHTML = '';
          container.style.display = 'none';
        }
      })
      .catch(error => console.error('Error:', error));
  }
};

window.addEventListener("turbo:load", category_select);
window.addEventListener("turbo:render", category_select);