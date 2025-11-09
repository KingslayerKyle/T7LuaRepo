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
	self:setLeftRight( true, false, 0, 232 )
	self:setTopBottom( true, false, 0, 18 )
	
	local Entry = LUI.UIText.new()
	Entry:setLeftRight( true, false, 20, 232 )
	Entry:setTopBottom( false, false, -6, 8 )
	Entry:setRGB( 1, 1, 1 )
	Entry:setTTF( "fonts/Entovo.ttf" )
	Entry:setLetterSpacing( 0.2 )
	Entry:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Entry:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Entry:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Entry:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Entry )
	self.Entry = Entry
	
	local talker = LUI.UIImage.new()
	talker:setLeftRight( true, false, 0, 18 )
	talker:setTopBottom( true, false, 0, 18 )
	talker:setRGB( 1, 1, 1 )
	talker:setImage( RegisterImage( "uie_t7_core_hud_voiptemp-01" ) )
	talker:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( talker )
	self.talker = talker
	
	local enemyEntry = LUI.UIText.new()
	enemyEntry:setLeftRight( true, false, 20, 232 )
	enemyEntry:setTopBottom( false, false, -6, 8 )
	enemyEntry:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
	enemyEntry:setAlpha( 0 )
	enemyEntry:setTTF( "fonts/Entovo.ttf" )
	enemyEntry:setLetterSpacing( 0.2 )
	enemyEntry:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	enemyEntry:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	enemyEntry:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			enemyEntry:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( enemyEntry )
	self.enemyEntry = enemyEntry
	
	local enemyTalker = LUI.UIImage.new()
	enemyTalker:setLeftRight( true, false, 0, 18 )
	enemyTalker:setTopBottom( true, false, 0, 18 )
	enemyTalker:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
	enemyTalker:setAlpha( 0 )
	enemyTalker:setImage( RegisterImage( "uie_t7_core_hud_voiptemp-01" ) )
	enemyTalker:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( enemyTalker )
	self.enemyTalker = enemyTalker
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Entry:completeAnimation()
				self.Entry:setAlpha( 1 )
				self.clipFinished( Entry, {} )
				talker:completeAnimation()
				self.talker:setAlpha( 1 )
				self.clipFinished( talker, {} )
				enemyEntry:completeAnimation()
				self.enemyEntry:setAlpha( 0 )
				self.clipFinished( enemyEntry, {} )
				enemyTalker:completeAnimation()
				self.enemyTalker:setAlpha( 0 )
				self.clipFinished( enemyTalker, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Entry:completeAnimation()
				self.Entry:setAlpha( 0 )
				self.clipFinished( Entry, {} )
				talker:completeAnimation()
				self.talker:setAlpha( 0 )
				self.clipFinished( talker, {} )
				enemyEntry:completeAnimation()
				self.enemyEntry:setAlpha( 0 )
				self.clipFinished( enemyEntry, {} )
				enemyTalker:completeAnimation()
				self.enemyTalker:setAlpha( 0 )
				self.clipFinished( enemyTalker, {} )
			end
		},
		EnemyTalking = {
			DefaultClip = function ()
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
	self.close = function ( self )
		self.Entry:close()
		self.enemyEntry:close()
		CoD.Voip_Entry.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

