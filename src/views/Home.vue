<template>
    <main v-if="!loading">Cool!</main>
    <main class="flex flex-col align-center justify-center text-center" v-else>
        <div class="text-gray-500 text-3xl mt-10 mb-6">
            Fetching Data
        </div>
        <img :src="loadingImage" class="w-24 m-auto" alt="Loading data"/>
    </main>
</template>

<script>
export default {
  name: "Home",
     components: {},
     data() {
         return{
             loading: true,
             title: 'Global',
             dataDate: '',
             stats: {},
             countries: [],
             loadingImage: require('../assets/loading.gif')
         }  
     },
     methods: {
         async fetchCovidData() {
             const res = await fetch('https://api.covid19api.com/summary')
             const data = await res.json()
             return data
         }  
     },
     async created(){
         const data = await this.fetchCovidData()
         this.dataDate = data.Date
         this.stats = data.Global
         this.countries = data.Countries
         this.loading = false
     },
 };
</script>
