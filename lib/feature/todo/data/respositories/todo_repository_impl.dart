import 'package:dartz/dartz.dart';
import 'package:done_it/core/error/exceptions.dart';
import 'package:done_it/core/error/failures.dart';
import 'package:done_it/feature/todo/data/datasources/todo_local_data_source.dart';
import 'package:done_it/feature/todo/domain/entities/todo.dart';
import 'package:done_it/feature/todo/domain/repositories/todo_repository.dart';
import 'package:flutter/cupertino.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource todoLocalDataSource;

  TodoRepositoryImpl({@required this.todoLocalDataSource});

  @override
  Future<Either<Failure, Todo>> getTodo(int id) async {
    try {
      return Right(await todoLocalDataSource.getTodo(id));
    } on DataBaseException {
      return Left(DataBaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<Todo>>> getAllTodo() async {
    try {
      return Right(await todoLocalDataSource.getAllTodo());
    } on DataBaseException {
      return Left(DataBaseFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addTodo(Todo todo) async{
    try {
      return Right(await todoLocalDataSource.addTodo(todo));
    } on DataBaseException {
    return Left(DataBaseFailure());
    }
  }
}
