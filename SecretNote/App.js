import React from 'react';
import { Button, ScrollView, Dimensions, StyleSheet, Text, TextInput, View, AlertIOS } from 'react-native';
import RNSecureStorage, { ACCESSIBLE } from 'rn-secure-storage'
import PasscodeAuth from 'react-native-touch-id'

export default class App extends React.Component {

  constructor(props) {
    super(props);
    // State
    this.state = {
      userInput: null,
      value: null,
      isStored: undefined,
    }
  }

  set = () => {
    if (this.state.userInput !== null) {
      RNSecureStorage.set('mySecretNote', this.state.userInput, { accessible: ACCESSIBLE.WHEN_UNLOCKED_THIS_DEVICE_ONLY })
        .then((res) => {
          this.setState({
            isStored: true
          })
        }, (err) => {
          alert(err);
        });
    } else {
      alert("Please enter a value")
    }
  }

  get = () =>  {
    RNSecureStorage.get('mySecretNote').then((val) => {
      this.setState({
        value: val,
        userInput: val,
      })
    }).catch((err) => {
      // alert(err)
    })
  }

  componentDidMount() {
    this.auth();
  }

  auth = () => {
    PasscodeAuth.authenticate('to get the note')
      .then(success => {
        this.setState({
          authenticated: true,
        })
        this.get();
      })
      .catch(error => {
        this.setState({
          authenticated: false,
        })
      });
  }

  render() {
    if (!this.state.authenticated) {
      return <ScrollView
        bounces={false}
        keyboardShouldPersistTaps='handled'
      >
        <View style={styles.container}>
          <View style={{
            flexDirection: 'row',
            paddingBottom: 20
          }}>

            <Button title={"Provide passcode"} onPress={this.auth} />
          </View>
        </View>
      </ScrollView>
    }
    return (
      <ScrollView
        bounces={false}
        keyboardShouldPersistTaps='handled'
      >
        <View style={styles.container}>
          <View>
            <View>
              <Text style={{
                fontSize: 12,
                paddingBottom: 10,
              }}>Note</Text>
              <TextInput style={styles.valueInput} placeholder={'Enter a value for storing'}
              defaultValue={this.state.value}
                onChangeText={(text) => this.setState({ userInput: text })} />
            </View>
            <View style={styles.buttonSet}>
              <Button title={"Save"} onPress={this.set} />
            </View>
          </View>
        </View>
      </ScrollView>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
    height: Dimensions.get('window').height
  },
  valueInput: {
    padding: 2,
    backgroundColor: '#FFF',
    borderWidth: 1,
    borderColor: '#F1f1f1',
    color: '#000000',
    minHeight: 300,
    width: 320,
  },
  buttonSet: {
    flexDirection: 'row',
    paddingVertical: 25,
    justifyContent: 'space-between'
  },
});
