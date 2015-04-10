'use strict';

var React = require('React');
var NativeModules = require('NativeModules');
var ReactIOSViewAttributes = require('ReactIOSViewAttributes');
var StyleSheet = require('StyleSheet');
var createReactIOSNativeComponentClass = require('createReactIOSNativeComponentClass');
var PropTypes = require('ReactPropTypes');
var NativeMethodsMixin = require('NativeMethodsMixin');
var flattenStyle = require('flattenStyle');
var merge = require('merge');

var PieChart = React.createClass({
  propTypes: {
    data: PropTypes.array
  },
  mixins: [NativeMethodsMixin],
  viewConfig: {
    uiViewClassName: 'UIView',
    validAttributes: ReactIOSViewAttributes.UIView
  },
  render: function () {
    var style = flattenStyle([styles.base, this.props.style]);
    var nativeProps = merge(this.props, {
      style
    });
    return <RNPieChart {...nativeProps}/>
  }
});

var RNPieChart = createReactIOSNativeComponentClass({
  validAttributes: merge(ReactIOSViewAttributes.UIView, {}),
  uiViewClassName: 'RNPieChart'
});

var styles = StyleSheet.create({
  base: {}
});

module.exports = PieChart;
