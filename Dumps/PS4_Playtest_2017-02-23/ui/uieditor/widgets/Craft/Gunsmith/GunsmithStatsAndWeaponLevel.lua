require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithStats" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithWarningWidget" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithWeaponLevel" )

CoD.GunsmithStatsAndWeaponLevel = InheritFrom( LUI.UIElement )
CoD.GunsmithStatsAndWeaponLevel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GunsmithStatsAndWeaponLevel )
	self.id = "GunsmithStatsAndWeaponLevel"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 849 )
	self:setTopBottom( 0, 0, 0, 214 )
	self.anyChildUsesUpdateState = true
	
	local stats = CoD.GunsmithStats.new( menu, controller )
	stats:setLeftRight( 0, 1, 36, 40 )
	stats:setTopBottom( 0, 0, 0, 114 )
	stats:setScale( 0.9 )
	stats:linkToElementModel( self, nil, false, function ( model )
		stats:setModel( model, controller )
	end )
	self:addElement( stats )
	self.stats = stats
	
	local weaponProgression = CoD.GunsmithWeaponLevel.new( menu, controller )
	weaponProgression:setLeftRight( 0, 0, 229, 849 )
	weaponProgression:setTopBottom( 0, 0, 114, 174 )
	weaponProgression.levelLabel.Label1:setText( Engine.Localize( "MPUI_WEAPON_LEVEL_CAPS" ) )
	weaponProgression.levelLabel.Label1:setTTF( "fonts/escom.ttf" )
	weaponProgression:subscribeToGlobalModel( controller, "GunsmithSnapshot", "SessionMode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponProgression.currentLevelBacking:setText( Engine.Localize( GetGunsmithCurrentWeaponLevel( controller, modelValue ) ) )
		end
	end )
	weaponProgression:subscribeToGlobalModel( controller, "GunsmithSnapshot", "SessionMode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponProgression.currentLevel:setText( Engine.Localize( GetGunsmithCurrentWeaponLevel( controller, modelValue ) ) )
		end
	end )
	weaponProgression:subscribeToGlobalModel( controller, "GunsmithSnapshot", "SessionMode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponProgression.cacWpnLvlMeter0.Meter:setShaderVector( 0, GetGunsmithCurrentWeaponXP( controller, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) ) )
		end
	end )
	weaponProgression:subscribeToGlobalModel( controller, "GunsmithSnapshot", "SessionMode", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			weaponProgression.nextLevel:setText( Engine.Localize( GetGunsmithNextWeaponLevel( controller, modelValue ) ) )
		end
	end )
	weaponProgression:linkToElementModel( self, nil, false, function ( model )
		weaponProgression:setModel( model, controller )
	end )
	self:addElement( weaponProgression )
	self.weaponProgression = weaponProgression
	
	local warningMsg = CoD.GunsmithWarningWidget.new( menu, controller )
	warningMsg:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return not Gunsmith_IsCurrentVariantChanged( controller )
			end
		}
	} )
	warningMsg:setLeftRight( 0, 0, 347, 849 )
	warningMsg:setTopBottom( 0, 0, 174, 214 )
	warningMsg.warningMsg.text:setText( Engine.Localize( "MENU_GUNSMITH_VARIANT_CHANGED_WARNING" ) )
	self:addElement( warningMsg )
	self.warningMsg = warningMsg
	
	self.resetProperties = function ()
		weaponProgression:completeAnimation()
		stats:completeAnimation()
		warningMsg:completeAnimation()
		weaponProgression:setLeftRight( 0, 0, 229, 849 )
		weaponProgression:setTopBottom( 0, 0, 114, 174 )
		weaponProgression:setAlpha( 1 )
		stats:setAlpha( 1 )
		warningMsg:setLeftRight( 0, 0, 347, 849 )
		warningMsg:setTopBottom( 0, 0, 174, 214 )
		warningMsg:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		StatsAndWeaponLevelHide = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				stats:completeAnimation()
				self.stats:setAlpha( 0 )
				self.clipFinished( stats, {} )
				weaponProgression:completeAnimation()
				self.weaponProgression:setAlpha( 0 )
				self.clipFinished( weaponProgression, {} )
				warningMsg:completeAnimation()
				self.warningMsg:setLeftRight( 0, 0, 285, 849 )
				self.warningMsg:setTopBottom( 0, 0, 174, 210 )
				self.warningMsg:setAlpha( 0 )
				self.clipFinished( warningMsg, {} )
			end
		},
		StatsHide = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				stats:completeAnimation()
				self.stats:setAlpha( 0 )
				self.clipFinished( stats, {} )
				weaponProgression:completeAnimation()
				self.weaponProgression:setLeftRight( 0, 0, 227, 849 )
				self.weaponProgression:setTopBottom( 0, 0, 0, 60 )
				self.clipFinished( weaponProgression, {} )
				warningMsg:completeAnimation()
				self.warningMsg:setLeftRight( 0, 0, 285, 849 )
				self.warningMsg:setTopBottom( 0, 0, 178, 214 )
				self.warningMsg:setAlpha( 0 )
				self.clipFinished( warningMsg, {} )
			end
		},
		WeaponLevelHide = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				weaponProgression:completeAnimation()
				self.weaponProgression:setAlpha( 0 )
				self.clipFinished( weaponProgression, {} )
				warningMsg:completeAnimation()
				self.warningMsg:setLeftRight( 0, 0, 339, 843 )
				self.warningMsg:setTopBottom( 0, 0, 120, 156 )
				self.clipFinished( warningMsg, {} )
			end
		}
	}
	self:subscribeToGlobalModel( controller, "GunsmithSnapshot", "SessionMode", function ( model )
		local element = self
		UpdateElementState( self, "weaponProgression", controller )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.stats:close()
		self.weaponProgression:close()
		self.warningMsg:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

