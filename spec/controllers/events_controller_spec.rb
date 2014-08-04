require 'spec_helper'
include AuthenticationHelpers

describe EventsController do
  subject { response }

  let(:affiliations) { ['admin'] }
  let(:user) { create :user, affiliations: affiliations }

  before { set_current_user user }

  describe 'index' do
    before { get :index }

    context 'not as an admin' do
      let(:affiliations) { ['student'] }
      it { should_not be_success }
      it { should have_http_status '403' }
    end

    context 'as an admin' do
      let(:affiliations) { ['admin'] }

      it { should be_success}
      it { should have_http_status '200' }
      it 'sees all events' do
        2.times{create :event}
        expect(assigns(:events).count).to eql Event.count
      end
    end
  end

  describe 'show' do
    let(:event) { create :event }
    before { get :show, id: event.id }

    context 'not as an admin' do
      let(:affiliations) { ['student'] }
      it { should_not be_success }
      it { should have_http_status '403' }
    end

    context 'as an admin' do
      let(:affiliations) { ['admin'] }
      it { should redirect_to(edit_event_path(event)) }
      it { should have_http_status '302' }
      it 'assigns @event' do
        expect(assigns(:event)).to eql event
      end
    end
  end

  describe 'edit' do
    let(:event) { create :event }
    before { get :edit, id: event.id }

    context 'not as an admin' do
      let(:affiliations) { ['student'] }
      it { should_not be_success }
      it { should have_http_status '403' }
    end

    context 'as an admin' do
      let(:affiliations) { ['admin'] }
      it { should be_success }
      it { should have_http_status '200' }
      it 'assigns @event' do
        expect(assigns(:event)).to eql event
      end
    end
  end

  describe 'update' do
    let(:event) { create :event }
    before { post :update, id: event.id, event: {title: 'MM color sorters'} }

    context 'not as an admin' do
      let(:affiliations) { ['student'] }
      it { should_not be_success }
      it { should have_http_status '403' }
    end

    context 'as an admin' do
      let(:affiliations) { ['admin'] }
      it { should redirect_to(edit_event_path(event)) }
      it { should have_http_status '302' }
      it 'assigns @event' do
        expect(assigns(:event)).to eql event
      end
      it 'successfully updates the event' do
        expect(assigns(:event).title).to eql 'MM color sorters'
      end
    end
  end

  describe 'new' do
    before { get :new }

    context 'not as an admin' do
      let(:affiliations) { ['student'] }
      it { should_not be_success }
      it { should have_http_status '403' }
    end

    context 'as an admin' do
      let(:affiliations) { ['admin'] }
      it { should be_success }
      it { should have_http_status '200' }
    end
  end

  describe 'create' do
    let(:event) { create :event }
    before { post :create, event: {title: 'MM color eaters'} }

    context 'not as an admin' do
      let(:affiliations) { ['student'] }
      it { should_not be_success }
      it { should have_http_status '403' }
    end

    context 'as an admin' do
      let(:affiliations) { ['admin'] }
      it { should redirect_to(edit_event_path(Event.last)) }
      it { should have_http_status '302' }
      it 'assigns @event' do
        expect(assigns(:event).title).to eql 'MM color eaters'
      end
    end
  end
end
