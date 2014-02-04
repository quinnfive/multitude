require 'spec_helper'

describe User do
  it { should have_many :task_subscriptions }

  describe "#subscribed?" do
    subject { User.make! }
    let(:task) { Task.make! }

    context "when the user didn't subscribed to the task" do
      it "should be false" do
        subject.subscribed?(task).should be == false
      end
    end

    context "when the user subscribed to a task" do
      before { TaskSubscription.make! user: subject, task: task }

      it "should be true" do
        subject.subscribed?(task).should be == true
      end
    end
  end

  describe "#delivered?" do
    subject { User.make! }
    let(:task) { Task.make! }
    before { @task_subscription = TaskSubscription.make! user: subject, task: task }

    context "when the user didn't delivered the task" do
      it "should be false" do
        subject.delivered?(task).should be == false
      end
    end

    context "when the user delivered the task" do
      before { Delivery.make! task_subscription: @task_subscription }
      it "should be true" do
        subject.delivered?(task).should be == true
      end
    end
  end

  describe "#accepted_delivery_for?" do
    subject { User.make! }
    let(:task) { Task.make! }
    before { @task_subscription = TaskSubscription.make! user: subject, task: task }
    before { @delivery = Delivery.make! task_subscription: @task_subscription }

    context "when the user have no accepted delivery for the task" do
      it "should be false" do
        subject.accepted_delivery_for?(task).should be == false
      end
    end

    context "when the user have an accepted delivery for the task" do
      before { @delivery.accept! }

      it "should be true" do
        subject.accepted_delivery_for?(task).should be == true
      end
    end
  end
end
