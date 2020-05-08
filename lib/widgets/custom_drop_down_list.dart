import 'dart:async';
import 'package:wallbreakersui/widgets.dart';
import 'package:wallbreakersui/data/data.dart';
import 'package:flutter/material.dart';


class CustomDropDownList<T> extends StatefulWidget {
  final Future<List<T>> Function() loadData;
  final String Function(T data) displayName;
  final Function(T value) onSelected;
  final CustomTextFieldController controller;
  final String title;
  final EdgeInsetsGeometry margin;
  final Validate validate;
  final bool shouldReload;

  const CustomDropDownList({Key key,@required this.loadData,@required this.displayName,@required this.controller, this.onSelected,@required this.title, this.margin, this.validate, this.shouldReload=false}) : super(key: key);
  @override
  _CustomDropDownListState<T> createState() => _CustomDropDownListState<T>();
}
class _CustomDropDownListState<T> extends State<CustomDropDownList<T>> {
  final StreamController<String> _streamController = StreamController.broadcast();
  List<T> _dataList;

  @override
  void initState() {
    super.initState();
    _getCollection();
//    WidgetsBinding.instance.addPostFrameCallback((_){
//      FocusScope.of(context).unfocus();
//    });
  }

  Future _getCollection() async{
    _dataList = await widget.loadData();
    Future.delayed(Duration(milliseconds: 60),(){
      if(!_streamController.isClosed) {
        if (_dataList != null && _dataList.length > 0) {
          _streamController.add("fetched");
        } else {
          _streamController.add("empty");
        }
      }
    });
  }
  _bindData()async {
    FocusScope.of(context).requestFocus( FocusNode());
    if(widget.shouldReload){
      _getCollection();
    }
    else if(_dataList != null && _dataList.length > 0) {
      Future.delayed(Duration(milliseconds: 350),(){
        if(!_streamController.isClosed){
          if(_dataList != null && _dataList.length > 0){
            _streamController.add("fetched");
          }else{
            _streamController.add("empty");
          }
        }
      });
    }else{
      _getCollection();
    }
  }

  @override
  void dispose() {
    _streamController.close();
    _dataList= null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopupWidget(
      child: Container(
        key: GlobalKey(),
        color: Colors.transparent,
        child:  CustomTextField(
          title: widget.title,
          controller: widget.controller,
          margin: widget.margin,
          icon: Icons.keyboard_arrow_down,
          enabled:false,
          validate: widget.validate,
        ),
      ),
      popupBuilder: (position,size){
        _bindData();
        if(((position.dy * 100)/ MediaQuery.of(context).size.height) > 54){
          //print("should show in top");
          return Transform.translate(
            offset: Offset(0, -(MediaQuery.of(context).size.height*32)/100),
            child: Container(
              height: (MediaQuery.of(context).size.height*32)/100,width: double.infinity,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: _buildListWidget(context, size),
              ),
            ),
          );
        }else{
          //print("should show in bottom");
          return Transform.translate(
            offset: Offset(0, size.height),
            child: _buildListWidget(context, size),
          );
        }
      },
    );
  }
  Container _buildListWidget(BuildContext context, Size size) {
    return Container(
      constraints: BoxConstraints(maxHeight: (MediaQuery.of(context).size.height*32)/100),
      width: size.width,
      margin: widget.margin??EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: C.elevationShadowColor,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: StreamBuilder<String>(
          stream: _streamController.stream,
          builder: (context, snapshot) {
            if(snapshot.data == "fetched"){
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 4),
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Column(
                    children: _dataList.asMap().map((k,v)=> MapEntry(k, _buildListItem(context, v, (k == _dataList.length -1)))).values.toList(),
                  ),
                ),
              );
            }else if(snapshot.data == "empty"){
              return _buildEmptyList();
            }
            return _buildLoadingSpinner();
          }
      ),
    );
  }
  GestureDetector _buildListItem(BuildContext context, T d,bool isLast) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pop();
        widget.onSelected?.call(d);
        widget.controller.text = widget.displayName?.call(d);
      },
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 24,right: 24, top: 10, bottom:isLast?16: 11,),
              child: Text(
                widget.displayName?.call(d),
                style: TextStyle(
                  color: Colors.black.withOpacity(.64),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            isLast?Offstage():Divider(color: Colors.grey.withOpacity(.2),thickness: 1,),
          ],
        ),
      ),
    );
  }
  Container _buildLoadingSpinner() {
    return Container(
      padding: EdgeInsets.only(top:24,bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 16,
            width: 16,
            child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.grey.withOpacity(.3)),),
          ),
          SizedBox(width: 16,),
          Text("Loading..", style: TextStyle(fontSize:16,color: Colors.grey.withOpacity(.6)),),
        ],
      ),
    );
  }
  Container _buildEmptyList() {
    return Container(
      padding: EdgeInsets.only(top:24,bottom: 24),
      height: 74,
      child: Center(
        child: Text("No option available", style: TextStyle(fontSize:16,color: Colors.grey.withOpacity(.6)),),
      ),
    );
  }
}