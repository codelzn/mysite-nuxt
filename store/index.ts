import { ref, Ref } from 'vue'
import { defineStore } from 'pinia'

interface CounterState {
  num: number
  myStr: Ref<string>
}

export const useCounterStore = defineStore('counter', {
  state: ():CounterState => ({
    num: 0,
    myStr: ref('hello')
  }),
  actions: {
    increment() {
      this.num ++
    }
  },
  getters: {
    getNum(state) {
      return state.num
    }
  }
})