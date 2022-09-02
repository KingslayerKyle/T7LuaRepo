-- af2cfec3ea8c4c9d872074071a1698cd
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithStats" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithWeaponLevel" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithWarningWidget" )

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
	self:setLeftRight( true, false, 0, 566 )
	self:setTopBottom( true, false, 0, 143 )
	self.anyChildUsesUpdateState = true
	
	local stats = CoD.GunsmithStats.new( menu, controller )
	stats:setLeftRight( true, true, 24, 26 )
	stats:setTopBottom( true, false, 0, 76 )
	stats:setScale( 0.9 )
	stats:linkToElementModel( self, nil, false, function ( model )
		stats:setModel( model, controller )
	end )
	self:addElement( stats )
	self.stats = stats
	
	local weaponProgression = CoD.GunsmithWeaponLevel.new( menu, controller )
	weaponProgression:setLeftRight( true, false, 153, 566 )
	weaponProgression:setTopBottom( true, false, 76, 116 )
	weaponProgression.levelLabel.Label1:setText( Engine.Localize( "MPUI_WEAPON_LEVEL_CAPS" ) )
	weaponProgression.levelLabel.Label1:setTTF( "fonts/escom.ttf" )
	weaponProgression:subscribeToGlobalModel( controller, "GunsmithSnapshot", "SessionMode", function ( model )
		local SessionMode = Engine.GetModelValue( model )
		if SessionMode then
			weaponProgression.currentLevelBacking:setText( Engine.Localize( GetGunsmithCurrentWeaponLevel( controller, SessionMode ) ) )
		end
	end )
	weaponProgression:subscribeToGlobalModel( controller, "GunsmithSnapshot", "SessionMode", function ( model )
		local SessionMode = Engine.GetModelValue( model )
		if SessionMode then
			weaponProgression.currentLevel:setText( Engine.Localize( GetGunsmithCurrentWeaponLevel( controller, SessionMode ) ) )
		end
	end )
	weaponProgression:subscribeToGlobalModel( controller, "GunsmithSnapshot", "SessionMode", function ( model )
		local SessionMode = Engine.GetModelValue( model )
		if SessionMode then
			weaponProgression.cacWpnLvlMeter0.Meter:setShaderVector( 0, GetGunsmithCurrentWeaponXP( controller, CoD.GetVectorComponentFromString( SessionMode, 1 ), CoD.GetVectorComponentFromString( SessionMode, 2 ), CoD.GetVectorComponentFromString( SessionMode, 3 ), CoD.GetVectorComponentFromString( SessionMode, 4 ) ) )
		end
	end )
	weaponProgression:subscribeToGlobalModel( controller, "GunsmithSnapshot", "SessionMode", function ( model )
		local SessionMode = Engine.GetModelValue( model )
		if SessionMode then
			weaponProgression.nextLevel:setText( Engine.Localize( GetGunsmithNextWeaponLevel( controller, SessionMode ) ) )
		end
	end )
	weaponProgression:linkToElementModel( self, nil, false, function ( model )
		weaponProgression:setModel( model, controller )
	end )
	self:addElement( weaponProgression )
	self.weaponProgression = weaponProgression
	
	local warningMsg = CoD.GunsmithWarningWidget.new( menu, controller )
	warningMsg:setLeftRight( true, false, 231, 566 )
	warningMsg:setTopBottom( true, false, 116, 143 )
	warningMsg.warningMsg.text:setText( Engine.Localize( "MENU_GUNSMITH_VARIANT_CHANGED_WARNING" ) )
	warningMsg:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return not Gunsmith_IsCurrentVariantChanged( controller )
			end
		}
	} )
	self:addElement( warningMsg )
	self.warningMsg = warningMsg
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				stats:completeAnimation()
				self.stats:setAlpha( 1 )
				self.clipFinished( stats, {} )

				weaponProgression:completeAnimation()
				self.weaponProgression:setLeftRight( true, false, 153, 566 )
				self.weaponProgression:setTopBottom( true, false, 76, 116 )
				self.weaponProgression:setAlpha( 1 )
				self.clipFinished( weaponProgression, {} )

				warningMsg:completeAnimation()
				self.warningMsg:setAlpha( 1 )
				self.clipFinished( warningMsg, {} )
			end
		},
		StatsAndWeaponLevelHide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				stats:completeAnimation()
				self.stats:setAlpha( 0 )
				self.clipFinished( stats, {} )

				weaponProgression:completeAnimation()
				self.weaponProgression:setAlpha( 0 )
				self.clipFinished( weaponProgression, {} )

				warningMsg:completeAnimation()
				self.warningMsg:setLeftRight( true, false, 190, 566 )
				self.warningMsg:setTopBottom( true, false, 116, 140 )
				self.warningMsg:setAlpha( 0 )
				self.clipFinished( warningMsg, {} )
			end
		},
		StatsHide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				stats:completeAnimation()
				self.stats:setAlpha( 0 )
				self.clipFinished( stats, {} )

				weaponProgression:completeAnimation()
				self.weaponProgression:setLeftRight( true, false, 151, 566 )
				self.weaponProgression:setTopBottom( true, false, 0, 40 )
				self.weaponProgression:setAlpha( 1 )
				self.weaponProgression:setXRot( 0 )
				self.weaponProgression:setYRot( 0 )
				self.clipFinished( weaponProgression, {} )

				warningMsg:completeAnimation()
				self.warningMsg:setLeftRight( true, false, 190, 566 )
				self.warningMsg:setTopBottom( true, false, 119, 143 )
				self.warningMsg:setAlpha( 0 )
				self.clipFinished( warningMsg, {} )
			end
		},
		WeaponLevelHide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				stats:completeAnimation()
				self.stats:setAlpha( 1 )
				self.clipFinished( stats, {} )

				weaponProgression:completeAnimation()
				self.weaponProgression:setAlpha( 0 )
				self.clipFinished( weaponProgression, {} )

				warningMsg:completeAnimation()
				self.warningMsg:setLeftRight( true, false, 226, 562 )
				self.warningMsg:setTopBottom( true, false, 80, 104 )
				self.warningMsg:setAlpha( 1 )
				self.clipFinished( warningMsg, {} )
			end
		}
	}
	self:subscribeToGlobalModel( controller, "GunsmithSnapshot", "SessionMode", function ( model )
		local f13_local0 = self
		UpdateElementState( self, "weaponProgression", controller )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.stats:close()
		element.weaponProgression:close()
		element.warningMsg:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

