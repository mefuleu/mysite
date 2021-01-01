from haystack import indexes
from .models import Case


class CaseIndex(indexes.SearchIndex, indexes.Indexable):
    text = indexes.CharField(document=True, use_template=True)
    title = indexes.CharField(model_attr='title')
    create = indexes.DateTimeField(model_attr='create')
    content = indexes.CharField(model_attr='content')

    def get_model(self):
        return Case

    def index_queryset(self, using=None):
        """Used when the entire index for model is updated."""
        return self.get_model().objects.all()