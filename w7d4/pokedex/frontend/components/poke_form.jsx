import React from 'react';
import { withRouter } from 'react-router';

class PokeForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: 'Justinmon',
      attack: 7,
      defense: 5,
      poke_type: 'bug',
      moves: 'left,right',
      image_url: '7.svg'
    };

    this.handleSubmit = this.handleSubmit.bind(this);
  }
  handleSubmit(e) {
    e.preventDefault();
    let newPoke = Object.assign({}, this.state);
    newPoke.moves = newPoke.moves.split(",");
    debugger;
    this.props.createPokemon({poke: newPoke}).then((data) => {
          this.props.router.push(`pokemon/${data.id}`);
  });
}



  update(property) {
    return e => this.setState({[property]: e.target.value});
  }

  render() {
    return(
      <form>
        <label>Name
          <input onChange={this.update('name')} type="text" name="poke[name]" value={this.state.name}/>
        </label>
        <label>Attack
          <input onChange={this.update('attack')}  type="number" name="poke[attack]" value={this.state.attack}/>
        </label>
        <label>Defense
          <input onChange={this.update('defense')}  type="number" name="poke[defense]" value={this.state.defense}/>
        </label>
        <label>Type
          <select onChange={this.update('type')} name="poke[type]">
            <option value="bug" defaultValue>bug</option>
            <option value="dragon">dragon</option>
            <option value="electric">electric</option>
            <option value="fighting">fighting</option>
            <option value="fire">fire</option>
            <option value="flying">flying</option>
            <option value="ghost">ghost</option>
            <option value="grass">grass</option>
            <option value="ground">ground</option>
            <option value="ice">ice</option>
            <option value="normal">normal</option>
            <option value="poison">poison</option>
            <option value="psychic">psychic</option>
            <option value="rock">rock</option>
            <option value="steel">steel</option>
            <option value="water">water</option>
          </select>
        </label>
        <label>Moves
          <input onChange={this.update('moves')}  type="text" name="poke[moves]" value={this.state.moves}/>
        </label>
        <label>Image URL
          <input onChange={this.update('image_url')}  type="text" name="poke[image_url]" value={this.state.image_url}/>
        </label>
        <input  type="submit" value="Create Pokemon" onClick={this.handleSubmit}/>
      </form>
    );
  }
}

export default withRouter(PokeForm);
