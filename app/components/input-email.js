// Generated by CoffeeScript 1.6.3
import Ember from 'ember';
var InputEmailComponent;

InputEmailComponent = InputTextComponent.extend({
  placeholder: 'email address',
  label: 'Email Address',
  validate: function(value, status) {
    if (!value || value.length === 0) {
      return this._super(value, status);
    } else if (!value.match("^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$")) {
      return status(false, 'Please enter a valid email address');
    } else {
      return setTimeout(function() {
        return status(true, 'Email address available');
      }, 1000);
    }
  }
});

export default InputEmailComponent;
