-- cea7edda3594485cf398cedc58edd977
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.CAC_varientTitlePanel" )

CoD.ChangeCybercoreLabel = InheritFrom( LUI.UIElement )
CoD.ChangeCybercoreLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ChangeCybercoreLabel )
	self.id = "ChangeCybercoreLabel"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 257 )
	self:setTopBottom( true, false, 0, 22 )
	
	local CACvarientTitlePanel0 = CoD.CAC_varientTitlePanel.new( menu, controller )
	CACvarientTitlePanel0:setLeftRight( true, true, 2, 0 )
	CACvarientTitlePanel0:setTopBottom( true, true, -1, -1 )
	CACvarientTitlePanel0:setAlpha( 0.4 )
	self:addElement( CACvarientTitlePanel0 )
	self.CACvarientTitlePanel0 = CACvarientTitlePanel0
	
	local chooseCybercorePrompt = LUI.UITightText.new()
	chooseCybercorePrompt:setLeftRight( true, false, 0, 257 )
	chooseCybercorePrompt:setTopBottom( true, false, 0, 22 )
	chooseCybercorePrompt:setText( Engine.Localize( "MENU_CHANGE_CYBERCORE" ) )
	chooseCybercorePrompt:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )

	LUI.OverrideFunction_CallOriginalFirst( chooseCybercorePrompt, "setText", function ( element, controller )
		ScaleWidgetToLabelWrapped( self, element, 0, 0 )
	end )
	self:addElement( chooseCybercorePrompt )
	self.chooseCybercorePrompt = chooseCybercorePrompt
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				chooseCybercorePrompt:completeAnimation()
				self.chooseCybercorePrompt:setText( Engine.Localize( "MENU_CHANGE_CYBERCORE" ) )
				self.clipFinished( chooseCybercorePrompt, {} )
			end
		},
		Multicore = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				chooseCybercorePrompt:completeAnimation()
				self.chooseCybercorePrompt:setText( Engine.Localize( "MENU_CHANGE_CYBERCORE" ) )
				self.clipFinished( chooseCybercorePrompt, {} )
			end
		},
		DefaultState_PC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				chooseCybercorePrompt:completeAnimation()
				self.chooseCybercorePrompt:setText( Engine.Localize( "PLATFORM_CHANGE_CYBERCORE" ) )
				self.clipFinished( chooseCybercorePrompt, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Multicore",
			condition = function ( menu, element, event )
				return IsMulticoreActivated( controller )
			end
		},
		{
			stateName = "DefaultState_PC",
			condition = function ( menu, element, event )
				return not IsGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f1_local3 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f1_local3( element, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CACvarientTitlePanel0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

