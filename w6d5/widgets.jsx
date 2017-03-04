import React from 'react';
import ReactDOM from 'react-dom';
import Tabs from './tabs';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById('root');
  let tabObjects = [
    {title: 'tab1', content: 't1 cont'},
    {title: 'tab2', content: 't2 cont'},
    {title: 'tab3', content: 't3 cont'}
  ];

  ReactDOM.render(<Tabs tabs={tabObjects} />, root);

});
