<template>
  <q-card class="centralDiv">
    <BackMobile />
    <BackDesktop v-if="!this.$q.platform.is.electron" />

    <div class="text-h6 text-central">
      Lista de Documentação de API publicas
    </div>

    <q-list
      v-for="(item, index) in listOfApis"
      :key="index"
      style="width:100%"
    >
      <q-separator />
      <q-item
        v-ripple
        clickable
        style="font-size: 18px;"
        @click="toPageCompletePublicDoc(item)"
      >
        <q-item-section
          avatar
          top
        >
          <i
            class="far fa-file-alt text-black"
            style="font-size: 3em;"
          />
        </q-item-section>
        <q-item-section>
          <q-item-label lines="5">
            <strong>Name:</strong> {{ item.apiName }}
          </q-item-label>

          <q-item-label lines="5">
            <strong>Publicado por:</strong> {{ item.name }}
          </q-item-label>

          <q-item-label caption>
            <strong>Descrição:</strong> {{ item.descriptionApi }}
          </q-item-label>
        </q-item-section>
      </q-item>
    </q-list>
  </q-card>
</template>

<script>
import BackMobile from '../components/fab/FabBtnBackMobile'
import BackDesktop from '../components/fab/FabBtnBackDesktop'

export default {
  name: 'PublicList',
  components: {
    BackMobile,
    BackDesktop
  },
  data () {
    return {
      listOfApis: []
    }
  },
  computed: {},
  created () {
    this.init()
  },
  methods: {
    async init () {
      this.indexPublicListDocs()
    },
    async indexPublicListDocs () {
      try {
        const result = await this.$axios.get('api/geral/listallpublicapi', {
          headers: this.cUser.headers
        })
        this.listOfApis = await result.data
      } catch (error) {
        this.$notify('Erro ao carregar lista de documentação publica', 'red')
      }
    },
    toPageCompletePublicDoc (item) {
      this.$router.push({
        name: 'DocViewPublic',
        params: { id: '' + item.id }
      })
    }
  }
}
</script>

<style lang="scss" scoped></style>
