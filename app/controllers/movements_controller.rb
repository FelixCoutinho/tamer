# encoding: UTF-8
class MovementsController < ApplicationController
  # GET /movements
  # GET /movements.xml
  def index
    @movements = Movement.all
  end

  # GET /movements/new
  # GET /movements/new.xml
  def new
    @movement = Movement.new
  end

  # GET /movements/1/edit
  def edit
    @movement = Movement.find(params[:id])
  end

  # POST /movements
  # POST /movements.xml
  def create
    @movement = Movement.new(params[:movement])

    respond_to do |format|

      if @movement.save        
        format.html { redirect_to(movements_url, :notice => 'Movement was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /movements/1
  # PUT /movements/1.xml
  def update
    @movement = Movement.find(params[:id])

    respond_to do |format|
      if @movement.update_attributes(params[:movement])
        format.html { redirect_to(movements_url, :notice => 'Movement was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /movements/1
  # DELETE /movements/1.xml
  def destroy
    @movement = Movement.find(params[:id])
    @movement.destroy

    respond_to do |format|
      format.html { redirect_to(movements_url, :notice => 'Movement was successfully destroyed.') }
    end
  end
  
  def graphic
    require 'gchart'
    movements_input_values = []
    movements_output_values = []
    Movement.all.each do |movement|
      if movement.flow == 'Entrada'
        movements_input_values << movement.value
      end
      if movement.flow == 'Saída'
        movements_output_values << movement.value
      end
    end
    @googlechart = Gchart.sparkline(:size => '940x230', 
                              :line_colors => '5ebc5e,e25550',                          
                              :legend => ['Entradas', 'Saídas'],
                              :data => [movements_input_values, movements_output_values])
    incoming_value = 0
    movements_input_values.each {|value| incoming_value += value}
    @total_incoming_value = incoming_value
    
    outcoming_value = 0
    movements_output_values.each {|value| outcoming_value += value}
    @total_outcoming_value = outcoming_value
  end
end
