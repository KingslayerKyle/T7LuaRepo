require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.CombatRecordGameModeStat = InheritFrom( LUI.UIElement )
CoD.CombatRecordGameModeStat.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordGameModeStat )
	self.id = "CombatRecordGameModeStat"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 249 )
	self:setTopBottom( 0, 0, 0, 51 )
	
	local WinsColorImage = LUI.UIImage.new()
	WinsColorImage:setLeftRight( 1, 1, -246, -230 )
	WinsColorImage:setTopBottom( 0, 0, 3, 44 )
	WinsColorImage:setRGB( 0.95, 0.91, 0.11 )
	self:addElement( WinsColorImage )
	self.WinsColorImage = WinsColorImage
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 0, 144, 249 )
	StartMenuframenoBG0:setTopBottom( 0, 0, 0, 48 )
	StartMenuframenoBG0:setAlpha( 0.8 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( 0, 0, 0, 151 )
	StartMenuframenoBG00:setTopBottom( 0, 0, 0, 48 )
	StartMenuframenoBG00:setAlpha( 0.8 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local WinsLabel = LUI.UIText.new()
	WinsLabel:setLeftRight( 1, 1, -217, -105 )
	WinsLabel:setTopBottom( 0, 0, 9, 39 )
	WinsLabel:setText( Engine.Localize( "MENU_WINS" ) )
	WinsLabel:setTTF( "fonts/default.ttf" )
	WinsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	WinsLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WinsLabel )
	self.WinsLabel = WinsLabel
	
	local StatValue = LUI.UIText.new()
	StatValue:setLeftRight( 0.5, 0.5, 27, 114 )
	StatValue:setTopBottom( 0.5, 0.5, -17, 13 )
	StatValue:setRGB( 1, 0.8, 0.4 )
	StatValue:setText( Engine.Localize( "888" ) )
	StatValue:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	StatValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	StatValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatValue )
	self.StatValue = StatValue
	
	local StatComparisonValue = LUI.UIText.new()
	StatComparisonValue:setLeftRight( 0.5, 0.5, 125, 212 )
	StatComparisonValue:setTopBottom( 0.5, 0.5, -17, 13 )
	StatComparisonValue:setRGB( ColorSet.PartyFriendlyBlue.r, ColorSet.PartyFriendlyBlue.g, ColorSet.PartyFriendlyBlue.b )
	StatComparisonValue:setText( Engine.Localize( "888" ) )
	StatComparisonValue:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	StatComparisonValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	StatComparisonValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatComparisonValue )
	self.StatComparisonValue = StatComparisonValue
	
	self.resetProperties = function ()
		StatComparisonValue:completeAnimation()
		StatComparisonValue:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				StatComparisonValue:completeAnimation()
				self.StatComparisonValue:setAlpha( 0 )
				self.clipFinished( StatComparisonValue, {} )
			end
		},
		Comparison = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Comparison",
			condition = function ( menu, element, event )
				return IsComparingStats( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordComparing" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CombatRecordComparing"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.InProgress" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "OtherPlayerStats.InProgress"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "OtherPlayerStats.Success" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "OtherPlayerStats.Success"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuframenoBG0:close()
		self.StartMenuframenoBG00:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

