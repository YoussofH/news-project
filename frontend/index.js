const newsForm = $("#news-form");

const newsContainer = $("#news-container");

const getAllNews = async () => {
    const response = await axios.get(
        `http://localhost/news-project/backend/api.php`
    );
    displayNews(response.data.new);
};

const renderedCards = (title, description, image_url) => {
    return `<div class="col-md-6 mb-3 news-card">
        <div class="card">
            <img src="${image_url}" class="card-img-top" alt="News Image">
            <div class="card-body">
                <h5 class="card-title">${title}</h5>
                <p class="card-text">${description}</p>
            </div>
        </div>
        </div>`;
}

const displayNews = (data) => {
    newsContainer.innerHTML = "";
    $.each(data, function(index, newsItem) {
        const cardHTML = renderedCards(newsItem.title, newsItem.description, newsItem.image_url);
        newsContainer.append(cardHTML);
    });
};



const addNews = async () => {
    try {
        const formData = new FormData(newsForm);

        const response = await axios.post(
            `http://localhost/news-project/backend/api.php`,
            formData
        );
        newsForm.reset();
        getAllNews();
    } catch (e) {
        console.error(e);
    }
};

newsForm.submit((e) => {
    e.preventDefault();
    addNews();
});

getAllNews();
