import { defineNuxtConfig } from 'nuxt';
import PluginGLSL from 'vite-plugin-glsl';
import PluginSVGLoader from 'vite-svg-loader';

// https://v3.nuxtjs.org/api/configuration/nuxt.config
export default defineNuxtConfig({
  ssr: true,
  // SSG
  target: 'static',
  sourcemap: false,
  app: {
    head: {
      htmlAttrs: { lang: 'ja' },
      meta: [
        { title: '私のブログ' },
        { charset: 'utf-8' },
        { lang: 'ja' },
        { name: 'viewport', content: 'width=device-width, initial-scale=1' },
        { hider: 'description', name: 'description', content: '私のブログ' },
      ],
      link: [{ rel: 'icon', href: '/favicon.png' }],
    },
  },
  vite: {
    plugins: [PluginGLSL(), PluginSVGLoader({ svgo: false })],
  },
  modules: ['@nuxtjs/tailwindcss', '@pinia/nuxt', '@vueuse/nuxt'],
  tailwindcss: {
    viewer: false,
  },
  build: {
    transpile: [
      'three'
    ]
  }
});
