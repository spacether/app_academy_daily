import React from 'react';
import ReactDOM from 'react-dom';

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    console.log(props);
    this.state = {index: 0};
    this.click = this.click.bind(this);
  }

  click(event) {
    this.setState( {index: parseInt(event.target.id)} );
  }

  render() {
    return (
    <div>
      <ul>
        {this.props.tabs.map( (item, i) => {
          let tabTitle = item.title;
          if (i === this.state.index) tabTitle = <b>{tabTitle}</b>;
          return (<li key={i} id={i} onClick={this.click}>{tabTitle}</li>);
        })}
      </ul>
      <article>{this.props.tabs[this.state.index].content} </article>
    </div>
    );
  }

}

export default Tabs;
