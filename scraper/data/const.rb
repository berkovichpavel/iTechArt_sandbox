# frozen_string_literal: true

URL = 'https://www.onliner.by/news'
TITLE = 'news-header__title'
IMAGE = 'news-header__image'
TEXT1 = 'news-entry__speech'
TEXT2 = 'news-text'
CSV_FILE_PATH = 'data/file.csv'
REGULAR_FOR_LINKS = %r{/2020/\d{2}/\d{2}}.freeze
COLUMNS = ['title', 'img href', 'text'].freeze
