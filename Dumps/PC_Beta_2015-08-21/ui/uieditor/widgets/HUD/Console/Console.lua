require( "ui.uieditor.widgets.HUD.Console.ConsoleEntryContainer" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	CoD.ConsoleUtility.Init( f1_arg0, f1_arg1, "console" )
end

CoD.Console = InheritFrom( LUI.UIElement )
CoD.Console.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Console )
	self.id = "Console"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 680 )
	self:setTopBottom( true, false, 0, 98 )
	
	local ConsoleEntry0 = CoD.ConsoleEntryContainer.new( menu, controller )
	ConsoleEntry0:setLeftRight( true, false, 0, 680 )
	ConsoleEntry0:setTopBottom( false, true, -20, 0 )
	ConsoleEntry0:subscribeToGlobalModel( controller, "HUDItems", "console.line0", function ( model )
		ConsoleEntry0:setModel( model, controller )
	end )
	self:addElement( ConsoleEntry0 )
	self.ConsoleEntry0 = ConsoleEntry0
	
	local ConsoleEntry1 = CoD.ConsoleEntryContainer.new( menu, controller )
	ConsoleEntry1:setLeftRight( true, false, 0, 680 )
	ConsoleEntry1:setTopBottom( false, true, -20, 0 )
	ConsoleEntry1:subscribeToGlobalModel( controller, "HUDItems", "console.line1", function ( model )
		ConsoleEntry1:setModel( model, controller )
	end )
	self:addElement( ConsoleEntry1 )
	self.ConsoleEntry1 = ConsoleEntry1
	
	local ConsoleEntry2 = CoD.ConsoleEntryContainer.new( menu, controller )
	ConsoleEntry2:setLeftRight( true, false, 0, 680 )
	ConsoleEntry2:setTopBottom( false, true, -20, 0 )
	ConsoleEntry2:subscribeToGlobalModel( controller, "HUDItems", "console.line2", function ( model )
		ConsoleEntry2:setModel( model, controller )
	end )
	self:addElement( ConsoleEntry2 )
	self.ConsoleEntry2 = ConsoleEntry2
	
	local ConsoleEntry3 = CoD.ConsoleEntryContainer.new( menu, controller )
	ConsoleEntry3:setLeftRight( true, false, 0, 680 )
	ConsoleEntry3:setTopBottom( false, true, -20, 0 )
	ConsoleEntry3:subscribeToGlobalModel( controller, "HUDItems", "console.line3", function ( model )
		ConsoleEntry3:setModel( model, controller )
	end )
	self:addElement( ConsoleEntry3 )
	self.ConsoleEntry3 = ConsoleEntry3
	
	local ConsoleEntry4 = CoD.ConsoleEntryContainer.new( menu, controller )
	ConsoleEntry4:setLeftRight( true, false, 0, 680 )
	ConsoleEntry4:setTopBottom( false, true, -20, 0 )
	ConsoleEntry4:subscribeToGlobalModel( controller, "HUDItems", "console.line4", function ( model )
		ConsoleEntry4:setModel( model, controller )
	end )
	self:addElement( ConsoleEntry4 )
	self.ConsoleEntry4 = ConsoleEntry4
	
	local ConsoleEntry5 = CoD.ConsoleEntryContainer.new( menu, controller )
	ConsoleEntry5:setLeftRight( true, false, 0, 680 )
	ConsoleEntry5:setTopBottom( false, true, -20, 0 )
	ConsoleEntry5:subscribeToGlobalModel( controller, "HUDItems", "console.line5", function ( model )
		ConsoleEntry5:setModel( model, controller )
	end )
	self:addElement( ConsoleEntry5 )
	self.ConsoleEntry5 = ConsoleEntry5
	
	local ConsoleEntry6 = CoD.ConsoleEntryContainer.new( menu, controller )
	ConsoleEntry6:setLeftRight( true, false, 0, 680 )
	ConsoleEntry6:setTopBottom( false, true, -20, 0 )
	ConsoleEntry6:subscribeToGlobalModel( controller, "HUDItems", "console.line6", function ( model )
		ConsoleEntry6:setModel( model, controller )
	end )
	self:addElement( ConsoleEntry6 )
	self.ConsoleEntry6 = ConsoleEntry6
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				ConsoleEntry0:completeAnimation()
				self.ConsoleEntry0:setAlpha( 1 )
				self.clipFinished( ConsoleEntry0, {} )
				ConsoleEntry1:completeAnimation()
				self.ConsoleEntry1:setAlpha( 1 )
				self.clipFinished( ConsoleEntry1, {} )
				ConsoleEntry2:completeAnimation()
				self.ConsoleEntry2:setAlpha( 1 )
				self.clipFinished( ConsoleEntry2, {} )
				ConsoleEntry3:completeAnimation()
				self.ConsoleEntry3:setAlpha( 1 )
				self.clipFinished( ConsoleEntry3, {} )
				ConsoleEntry4:completeAnimation()
				self.ConsoleEntry4:setAlpha( 1 )
				self.clipFinished( ConsoleEntry4, {} )
				ConsoleEntry5:completeAnimation()
				self.ConsoleEntry5:setAlpha( 1 )
				self.clipFinished( ConsoleEntry5, {} )
				ConsoleEntry6:completeAnimation()
				self.ConsoleEntry6:setAlpha( 1 )
				self.clipFinished( ConsoleEntry6, {} )
			end
		},
		HideForCodCaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				ConsoleEntry0:completeAnimation()
				self.ConsoleEntry0:setAlpha( 0 )
				self.clipFinished( ConsoleEntry0, {} )
				ConsoleEntry1:completeAnimation()
				self.ConsoleEntry1:setAlpha( 0 )
				self.clipFinished( ConsoleEntry1, {} )
				ConsoleEntry2:completeAnimation()
				self.ConsoleEntry2:setAlpha( 0 )
				self.clipFinished( ConsoleEntry2, {} )
				ConsoleEntry3:completeAnimation()
				self.ConsoleEntry3:setAlpha( 0 )
				self.clipFinished( ConsoleEntry3, {} )
				ConsoleEntry4:completeAnimation()
				self.ConsoleEntry4:setAlpha( 0 )
				self.clipFinished( ConsoleEntry4, {} )
				ConsoleEntry5:completeAnimation()
				self.ConsoleEntry5:setAlpha( 0 )
				self.clipFinished( ConsoleEntry5, {} )
				ConsoleEntry6:completeAnimation()
				self.ConsoleEntry6:setAlpha( 0 )
				self.clipFinished( ConsoleEntry6, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HideForCodCaster",
			condition = function ( menu, element, event )
				return IsCodCaster( controller ) and not IsCodCasterProfileValueEqualTo( controller, "shoutcaster_killfeed", 1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ConsoleEntry0:close()
		element.ConsoleEntry1:close()
		element.ConsoleEntry2:close()
		element.ConsoleEntry3:close()
		element.ConsoleEntry4:close()
		element.ConsoleEntry5:close()
		element.ConsoleEntry6:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

