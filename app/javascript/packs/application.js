//= require jquery
//= require jquery_ujs

import "bootstrap";

import { player } from '../plugins/init_plyr';

import Mercury from '@postlight/mercury-parser';
const url = "https://www.lemonde.fr/international/article/2020/02/11/coronavirus-villes-desertes-teletravail-et-quarantaine-le-quotidien-en-chine-raconte-par-des-expatries_6029196_3210.html"
const url2 = "https://www.20minutes.fr/high-tech/2715459-20200211-video-galaxy-s20-128-megapixels-8k-nouveaux-samsung-smartphones-photo-ultimes"
const url3 = "https://korben.info/onedev-une-alternative-legere-a-gitlab.html"
Mercury.parse(url3).then(result => console.log(result));
