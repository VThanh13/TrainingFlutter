import '../db_helper/repository.dart';
import '../models/job.dart';

class JobController {
  late Repository _repository;
  JobController() {
    _repository = Repository();
  }

  saveJob(Job job) async {
    return await _repository.insertData('jobs', job.jobMap());
  }

  readAllJob() async {
    return await _repository.readData('jobs');
  }

  updateJob(Job job) async {
    return await _repository.updateData('jobs', job.jobMap());
  }

  deleteJob(jobId) async {
    return await _repository.deleteDataById('jobs', jobId);
  }
}
