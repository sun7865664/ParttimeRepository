<template>
    <div style="width: 1280px; height:auto; margin-top: 30px; padding-top: 40px; padding-left: 20px; background:white">
        <Tabs v-model="value" :animated="ani"  style="border: 1px solid #f0f0f0; margin-left: 40px; margin-right: 40px ">
            <TabPane label="基本信息"></TabPane>
            <TabPane label="发动机信息" name="engine"><engine :regNumber="regNumber"/></TabPane>
            <TabPane label="飞行记录本" name="flightrecord"><flightrecord :regNumber="regNumber"/></TabPane>
            <TabPane label="工作保留单" name="workreserve"><workreserve :regNumber="regNumber"/></TabPane>
            <TabPane label="故障保留单" name="faultreserve"><faultreserve :regNumber="regNumber"/></TabPane>
            <TabPane label="维修与改装" name="repairmodified"><repairmodified :regNumber="regNumber"/></TabPane>
        </Tabs>
    </div>
</template>
<script>
import workreserve from './workreserve.vue'
import faultreserve from './faultreserve.vue'
import repairmodified from './repairmodified.vue'
import flightrecord from './flightrecord.vue'
import engine from './engine.vue'

export default {
    components: {
        engine,
        flightrecord,
        workreserve,
        faultreserve,
        repairmodified,
    },
    data(){
        return{
            value:'',
            ani:false,
            regNumber: 'NR5821'
        }
    },
    mounted() {
    },
    created(){
        this.value = this.$route.query.value;
        if(this.$route.query.regNumber) {
            this.regNumber = this.$route.query.regNumber;
        }
    },
}
</script>

