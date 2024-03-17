const newsForm = document.getElementById("news-form");

const newsContainer = document.getElementById("news-container");

const getAllNews = async () => {
    const response = await axios.get(
        `http://localhost/news-project/backend/api.php`
    );
    console.log(response.data.new);
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
    data.forEach((newsItem) => {
        const cardHTML = renderedCards(newsItem.title, newsItem.description, newsItem.image_url);
        newsContainer.innerHTML += cardHTML;
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

newsForm.addEventListener("submit", (e) => {
    e.preventDefault();
    addNews();
});

getAllNews();
