class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
def index
  @projects = [
    { id: 1, name: "Plan&Go", description: "AI powered travel app", image_url: "https://giffiles.alphacoders.com/474/4748.gif", type: "Web Dev" },
    { id: 2, name: "Bandcamp", description: "App redesign", image_url: "https://f4.bcbits.com/img/0027834469_0", type: "UX Design" },
    { id: 3, name: "British Fencing", description: "Information Architecture", image_url: "https://freight.cargo.site/t/original/i/5b4cc062d685ba39a884774e058e39e1070f33430879e0af609e8a8bc4674a0f/006_Cardsort_Square_1.gif", type: "UX Design" },
  ]
end

  # GET /projects/1 or /projects/1.json
def show_partial
  project_name = params[:name].downcase.gsub(/[^a-z0-9]/, '')
  if lookup_context.template_exists?(project_name, 'projects', true)
    render partial: "projects/#{project_name}"
  else
    render plain: "Partial not found", status: :not_found
  end
end


  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy!

    respond_to do |format|
      format.html { redirect_to projects_path, status: :see_other, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:title, :description, :slug)
    end
end
