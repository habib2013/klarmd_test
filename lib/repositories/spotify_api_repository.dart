import 'package:either_option/either_option.dart';
import 'package:klarmd_test/datasources/spotify_api_datasource.dart';
import 'package:klarmd_test/errors/exceptions.dart';
import 'package:klarmd_test/errors/failures.dart';
import 'package:klarmd_test/models/models.dart';
import 'package:graphql/client.dart';

abstract class ISpotifyApiRepository {
  Future<Either<Failure, List<Artist>>> getArtists(String name);
}

class SpotifyApiRepository implements ISpotifyApiRepository {
  SpotifyApiRepository(this.dataSource);
  
  final ISpotifyApiDataSource dataSource;

  @override
  Future<Either<Failure, List<Artist>>> getArtists(String name) async {
    try {
      final data = await dataSource.getArtists(name);
      return Right(data);
    } on OperationException catch (e) {
      return Left(OperationFailure(e.graphqlErrors.first.message));
    } on NoResultsFoundException {
      return Left(NoResultsFoundFailure());
    } on Exception {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnhandledFailure());
    }
  }
}
