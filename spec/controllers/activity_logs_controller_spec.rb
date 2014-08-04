require 'spec_helper'
include AuthenticationHelpers

describe ActivityLogsController do
subject { response }

  let(:affiliations) { ['admin'] }
  let(:user) { create :user, affiliations: affiliations }

  before { set_current_user user }

  describe 'edit' do
    let!(:event) { create :event }
    let!(:activity_log) { create :activity_log, associated_id: event.id, associated_class: 'Event' }
    before { get :edit, id: activity_log.id, event_id: event.id, activity_log: { action_performed: 'Skip' }  }

    context 'as an admin' do
      let(:affiliations) { ['admin'] }
      it { should be_success }
      it { should have_http_status '200' }
      it 'assigns @activity_log' do
        expect(assigns(:activity_log)).to eql activity_log
      end
    end

    context 'not as an admin' do
      let(:affiliations) { ['student'] }
      it { should_not be_success }
      it { should have_http_status '403' }
    end
  end

  describe 'update' do
    let!(:event) { create :event }
    let!(:activity_log) { create :activity_log, associated_id: event.id, associated_class: 'Event' }
    before { post :update, id: activity_log.id, event_id: event.id, activity_log: { action_performed: 'Skip' } }

    context 'as an admin' do
      let(:affiliations) { ['admin'] }
      it { should redirect_to(edit_event_path(event.id, anchor: 'activity_logs')) }
      it { should have_http_status '302' }
      it 'assigns @activity_log' do
        expect(assigns(:activity_log)).to eql activity_log
      end
      it 'successfully updates the academic program' do
        expect(assigns(:activity_log).action_performed).to eql 'Skip'
      end
    end

    context 'not as an admin' do
      let(:affiliations) { ['student'] }
      it { should_not be_success }
      it { should have_http_status '403'}
    end
  end

  describe 'new' do
    let!(:event) { create :event }
    let!(:activity_log) { create :activity_log, associated_id: event.id }
    before { get :new, event_id: event.id, activity_log: {action_performed: 'Create'} }

    context 'as an admin' do
      let(:affiliations) { ['admin'] }
      it { should be_success }
      it { should have_http_status '200' }
    end

    context 'not as an admin' do
      let(:affiliations) { ['student'] }
      it { should_not be_success }
      it { should have_http_status '403' }
    end
  end

  describe 'create' do
    let!(:event) { create :event }
    let!(:activity_log) { create :activity_log, associated_id: event.id }
    before { post :create, event_id: event.id, activity_log: {action_performed: 'Skip'} }

    context 'as an admin' do
      let(:affiliations) { ['admin'] }
      it { should redirect_to(edit_event_path(event.id, anchor: 'activity_logs')) }
      it { should have_http_status '302' }
      it 'assigns @activity_log' do
        expect(assigns(:activity_log).action_performed).to eql 'Skip'
      end
    end

    context 'not as an admin' do
      let(:affiliations) { ['student'] }
      it { should_not be_success }
      it { should have_http_status '403' }
    end
  end
end
