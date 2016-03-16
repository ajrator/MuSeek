import Vue from 'vue';
import VueRouter from 'vue-router';
import App from './App';
import 'src/static/css/styles.css';
import 'src/static/css/stylish-portfolio.css';
import 'bootstrap-webpack';
//import Gp3 from './pages/splash';


// Configure plugins
Vue.use(VueRouter);
Vue.config.debug = true;
// Configure router
/* eslint-disable no-new */
var router = new VueRouter();
/* eslint-enable no-new */

router.map({
  '/': {
    component: App
  }
});

router.start(App, 'app');
