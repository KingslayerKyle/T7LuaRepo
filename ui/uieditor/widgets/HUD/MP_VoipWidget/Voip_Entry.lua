-- ca236f1b3aa5fc4f5c0f36d0834705a5
-- This hash is used for caching, delete to decompile the file again

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
	
	local Entry = LUI.UITightText.new()
	Entry:setLeftRight( true, false, 20, 232 )
	Entry:setTopBottom( false, false, -6, 8 )
	Entry:setTTF( "fonts/escom.ttf" )
	Entry:setLetterSpacing( 0.2 )
	Entry:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			Entry:setText( name )
		end
	end )
	self:addElement( Entry )
	self.Entry = Entry
	
	local talker = LUI.UIImage.new()
	talker:setLeftRight( true, false, 0, 18 )
	talker:setTopBottom( true, false, 0, 18 )
	talker:setImage( RegisterImage( "uie_t7_core_hud_voiptemp-01" ) )
	self:addElement( talker )
	self.talker = talker
	
	local enemyEntry = LUI.UITightText.new()
	enemyEntry:setLeftRight( true, false, 20, 232 )
	enemyEntry:setTopBottom( false, false, -6, 8 )
	enemyEntry:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
	enemyEntry:setAlpha( 0 )
	enemyEntry:setTTF( "fonts/escom.ttf" )
	enemyEntry:setLetterSpacing( 0.2 )
	enemyEntry:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			enemyEntry:setText( name )
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
	self:addElement( enemyTalker )
	self.enemyTalker = enemyTalker
	
	local forceUI3dDraw = LUI.UIImage.new()
	forceUI3dDraw:setLeftRight( true, false, 0, 232 )
	forceUI3dDraw:setTopBottom( true, false, 0, 18 )
	forceUI3dDraw:setRGB( 0, 0, 0 )
	forceUI3dDraw:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( forceUI3dDraw )
	self.forceUI3dDraw = forceUI3dDraw
	
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Entry:close()
		element.enemyEntry:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

