require 'spec_helper'

describe ScoresController do
  render_views
  let(:score) {Score.create(title: "Wario's Fat", composer: 'A six year old')}
    it "should create a new score" do
      expect(score.title).to eq("Wario's Fat")
    end

    it "should be associated with a user" do     
      score.user_id = 1
      expect(score.user_id).to eq(1)
    end

    it "finds a score by id in the show method" do
      score.user_id = 1
      score_by_id = score
      expect(score_by_id.title).to eq("Wario's Fat")
    end

end
