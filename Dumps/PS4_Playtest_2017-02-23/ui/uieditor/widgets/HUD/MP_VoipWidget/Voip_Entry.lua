CoD.Voip_Entry = InheritFrom( LUI.UIElement )
CoD.Voip_Entry.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Voip_Entry )
	self.id = "Voip_Entry"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 348 )
	self:setTopBottom( 0, 0, 0, 27 )
	
	local Entry = LUI.UITightText.new()
	Entry:setLeftRight( 0, 0, 30, 348 )
	Entry:setTopBottom( 0.5, 0.5, -9, 12 )
	Entry:setTTF( "fonts/escom.ttf" )
	Entry:setLetterSpacing( 0.2 )
	Entry:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Entry:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Entry )
	self.Entry = Entry
	
	local talker = LUI.UIImage.new()
	talker:setLeftRight( 0, 0, 0, 27 )
	talker:setTopBottom( 0, 0, 0, 27 )
	talker:setImage( RegisterImage( "uie_t7_core_hud_voiptemp-01" ) )
	self:addElement( talker )
	self.talker = talker
	
	local enemyEntry = LUI.UITightText.new()
	enemyEntry:setLeftRight( 0, 0, 30, 348 )
	enemyEntry:setTopBottom( 0.5, 0.5, -9, 12 )
	enemyEntry:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
	enemyEntry:setAlpha( 0 )
	enemyEntry:setTTF( "fonts/escom.ttf" )
	enemyEntry:setLetterSpacing( 0.2 )
	enemyEntry:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			enemyEntry:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( enemyEntry )
	self.enemyEntry = enemyEntry
	
	local enemyTalker = LUI.UIImage.new()
	enemyTalker:setLeftRight( 0, 0, 0, 27 )
	enemyTalker:setTopBottom( 0, 0, 0, 27 )
	enemyTalker:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
	enemyTalker:setAlpha( 0 )
	enemyTalker:setImage( RegisterImage( "uie_t7_core_hud_voiptemp-01" ) )
	self:addElement( enemyTalker )
	self.enemyTalker = enemyTalker
	
	local forceUI3dDraw = LUI.UIImage.new()
	forceUI3dDraw:setLeftRight( 0, 0, 0, 348 )
	forceUI3dDraw:setTopBottom( 0, 0, 0, 27 )
	forceUI3dDraw:setRGB( 0, 0, 0 )
	forceUI3dDraw:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( forceUI3dDraw )
	self.forceUI3dDraw = forceUI3dDraw
	
	self.resetProperties = function ()
		Entry:completeAnimation()
		talker:completeAnimation()
		enemyTalker:completeAnimation()
		enemyEntry:completeAnimation()
		Entry:setAlpha( 1 )
		talker:setAlpha( 1 )
		enemyTalker:setAlpha( 0 )
		enemyEntry:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Entry:completeAnimation()
				self.Entry:setAlpha( 0 )
				self.clipFinished( Entry, {} )
				talker:completeAnimation()
				self.talker:setAlpha( 0 )
				self.clipFinished( talker, {} )
			end
		},
		EnemyTalking = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				Entry:completeAnimation()
				self.Entry:setAlpha( 0 )
				self.clipFinished( Entry, {} )
				talker:completeAnimation()
				self.talker:setAlpha( 0 )
				self.clipFinished( talker, {} )
				enemyEntry:completeAnimation()
				self.enemyEntry:setAlpha( 1 )
				self.clipFinished( enemyEntry, {} )
				enemyTalker:completeAnimation()
				self.enemyTalker:setAlpha( 1 )
				self.clipFinished( enemyTalker, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "status", Enum.eVoipStatus.VOIP_HIDDEN )
			end
		},
		{
			stateName = "EnemyTalking",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "status", Enum.eVoipStatus.VOIP_ENEMY_TALKING )
			end
		}
	} )
	self:linkToElementModel( self, "status", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "status"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Entry:close()
		self.enemyEntry:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

