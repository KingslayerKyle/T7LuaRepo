-- 533d405fecacb66339b7d85f11944a4a
-- This hash is used for caching, delete to decompile the file again

CoD.CodCasterPlayerListHeaderObjectiveColumn = InheritFrom( LUI.UIElement )
CoD.CodCasterPlayerListHeaderObjectiveColumn.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CodCasterPlayerListHeaderObjectiveColumn )
	self.id = "CodCasterPlayerListHeaderObjectiveColumn"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 24 )
	self:setTopBottom( true, false, 0, 24 )
	
	local FlagCTF = LUI.UIImage.new()
	FlagCTF:setLeftRight( true, true, 0, 0 )
	FlagCTF:setTopBottom( true, true, 0, 0 )
	FlagCTF:setAlpha( 0 )
	FlagCTF:setImage( RegisterImage( "uie_t7_codcaster_gamemode_ctf" ) )
	self:addElement( FlagCTF )
	self.FlagCTF = FlagCTF
	
	local Bomb = LUI.UIImage.new()
	Bomb:setLeftRight( true, true, 0, 0 )
	Bomb:setTopBottom( true, true, 0, 0 )
	Bomb:setAlpha( 0 )
	Bomb:setImage( RegisterImage( "uie_t7_codcaster_gamemode_snd" ) )
	self:addElement( Bomb )
	self.Bomb = Bomb
	
	local Hardpoint = LUI.UIImage.new()
	Hardpoint:setLeftRight( true, true, 0, 0 )
	Hardpoint:setTopBottom( true, true, 0, 0 )
	Hardpoint:setAlpha( 0 )
	Hardpoint:setImage( RegisterImage( "uie_t7_codcaster_gamemode_hardpoint" ) )
	self:addElement( Hardpoint )
	self.Hardpoint = Hardpoint
	
	local Ball = LUI.UIImage.new()
	Ball:setLeftRight( true, true, 0, 0 )
	Ball:setTopBottom( true, true, 0, 0 )
	Ball:setAlpha( 0 )
	Ball:setImage( RegisterImage( "uie_t7_codcaster_gamemode_uplink" ) )
	self:addElement( Ball )
	self.Ball = Ball
	
	local FlagDom = LUI.UIImage.new()
	FlagDom:setLeftRight( true, true, 0, 0 )
	FlagDom:setTopBottom( true, true, 0, 0 )
	FlagDom:setAlpha( 0 )
	FlagDom:setImage( RegisterImage( "uie_t7_codcaster_gamemode_domination" ) )
	self:addElement( FlagDom )
	self.FlagDom = FlagDom
	
	local Default = LUI.UIImage.new()
	Default:setLeftRight( true, true, 0, 0 )
	Default:setTopBottom( true, true, 0, 0 )
	Default:setImage( RegisterImage( "uie_t7_codcaster_gamemode_tdm" ) )
	self:addElement( Default )
	self.Default = Default
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				FlagCTF:completeAnimation()
				self.FlagCTF:setAlpha( 0 )
				self.clipFinished( FlagCTF, {} )
				Bomb:completeAnimation()
				self.Bomb:setAlpha( 0 )
				self.clipFinished( Bomb, {} )
				Hardpoint:completeAnimation()
				self.Hardpoint:setAlpha( 0 )
				self.clipFinished( Hardpoint, {} )
				Ball:completeAnimation()
				self.Ball:setAlpha( 0 )
				self.clipFinished( Ball, {} )
				FlagDom:completeAnimation()
				self.FlagDom:setAlpha( 0 )
				self.clipFinished( FlagDom, {} )
				Default:completeAnimation()
				self.Default:setAlpha( 1 )
				self.clipFinished( Default, {} )
			end,
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				FlagCTF:completeAnimation()
				self.FlagCTF:setAlpha( 0 )
				self.clipFinished( FlagCTF, {} )
				Bomb:completeAnimation()
				self.Bomb:setAlpha( 0 )
				self.clipFinished( Bomb, {} )
				Hardpoint:completeAnimation()
				self.Hardpoint:setAlpha( 0 )
				self.clipFinished( Hardpoint, {} )
				Ball:completeAnimation()
				self.Ball:setAlpha( 0 )
				self.clipFinished( Ball, {} )
				Default:completeAnimation()
				self.Default:setAlpha( 1 )
				self.clipFinished( Default, {} )
			end
		},
		CTF = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				FlagCTF:completeAnimation()
				self.FlagCTF:setAlpha( 1 )
				self.clipFinished( FlagCTF, {} )
				Bomb:completeAnimation()
				self.Bomb:setAlpha( 0 )
				self.clipFinished( Bomb, {} )
				Hardpoint:completeAnimation()
				self.Hardpoint:setAlpha( 0 )
				self.clipFinished( Hardpoint, {} )
				Ball:completeAnimation()
				self.Ball:setAlpha( 0 )
				self.clipFinished( Ball, {} )
				FlagDom:completeAnimation()
				self.FlagDom:setAlpha( 0 )
				self.clipFinished( FlagDom, {} )
				Default:completeAnimation()
				self.Default:setRGB( 1, 1, 1 )
				self.Default:setAlpha( 0 )
				self.clipFinished( Default, {} )
			end
		},
		SDorSRorDem = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				FlagCTF:completeAnimation()
				self.FlagCTF:setAlpha( 0 )
				self.clipFinished( FlagCTF, {} )
				Bomb:completeAnimation()
				self.Bomb:setAlpha( 1 )
				self.clipFinished( Bomb, {} )
				Hardpoint:completeAnimation()
				self.Hardpoint:setAlpha( 0 )
				self.clipFinished( Hardpoint, {} )
				Ball:completeAnimation()
				self.Ball:setAlpha( 0 )
				self.clipFinished( Ball, {} )
				FlagDom:completeAnimation()
				self.FlagDom:setAlpha( 0 )
				self.clipFinished( FlagDom, {} )
				Default:completeAnimation()
				self.Default:setAlpha( 0 )
				self.clipFinished( Default, {} )
			end
		},
		Dom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				FlagCTF:completeAnimation()
				self.FlagCTF:setAlpha( 0 )
				self.clipFinished( FlagCTF, {} )
				Bomb:completeAnimation()
				self.Bomb:setAlpha( 0 )
				self.clipFinished( Bomb, {} )
				Hardpoint:completeAnimation()
				self.Hardpoint:setAlpha( 0 )
				self.clipFinished( Hardpoint, {} )
				Ball:completeAnimation()
				self.Ball:setAlpha( 0 )
				self.clipFinished( Ball, {} )
				FlagDom:completeAnimation()
				self.FlagDom:setAlpha( 1 )
				self.clipFinished( FlagDom, {} )
				Default:completeAnimation()
				self.Default:setAlpha( 0 )
				self.clipFinished( Default, {} )
			end
		},
		Hardpoint = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				FlagCTF:completeAnimation()
				self.FlagCTF:setAlpha( 0 )
				self.clipFinished( FlagCTF, {} )
				Bomb:completeAnimation()
				self.Bomb:setAlpha( 0 )
				self.clipFinished( Bomb, {} )
				Hardpoint:completeAnimation()
				self.Hardpoint:setAlpha( 1 )
				self.clipFinished( Hardpoint, {} )
				Ball:completeAnimation()
				self.Ball:setAlpha( 0 )
				self.clipFinished( Ball, {} )
				FlagDom:completeAnimation()
				self.FlagDom:setAlpha( 0 )
				self.clipFinished( FlagDom, {} )
				Default:completeAnimation()
				self.Default:setAlpha( 0 )
				self.clipFinished( Default, {} )
			end
		},
		Uplink = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				FlagCTF:completeAnimation()
				self.FlagCTF:setAlpha( 0 )
				self.clipFinished( FlagCTF, {} )
				Bomb:completeAnimation()
				self.Bomb:setAlpha( 0 )
				self.clipFinished( Bomb, {} )
				Hardpoint:completeAnimation()
				self.Hardpoint:setAlpha( 0 )
				self.clipFinished( Hardpoint, {} )
				Ball:completeAnimation()
				self.Ball:setAlpha( 1 )
				self.clipFinished( Ball, {} )
				FlagDom:completeAnimation()
				self.FlagDom:setAlpha( 0 )
				self.clipFinished( FlagDom, {} )
				Default:completeAnimation()
				self.Default:setAlpha( 0 )
				self.clipFinished( Default, {} )
			end
		},
		Safeguard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				FlagCTF:completeAnimation()
				self.FlagCTF:setAlpha( 0 )
				self.clipFinished( FlagCTF, {} )
				Bomb:completeAnimation()
				self.Bomb:setAlpha( 0 )
				self.clipFinished( Bomb, {} )
				Hardpoint:completeAnimation()
				self.Hardpoint:setAlpha( 0 )
				self.clipFinished( Hardpoint, {} )
				Ball:completeAnimation()
				self.Ball:setAlpha( 0 )
				self.clipFinished( Ball, {} )
				FlagDom:completeAnimation()
				self.FlagDom:setAlpha( 1 )
				self.clipFinished( FlagDom, {} )
				Default:completeAnimation()
				self.Default:setAlpha( 0 )
				self.clipFinished( Default, {} )
			end
		},
		GunGame = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				FlagCTF:completeAnimation()
				self.FlagCTF:setAlpha( 0 )
				self.clipFinished( FlagCTF, {} )
				Bomb:completeAnimation()
				self.Bomb:setAlpha( 0 )
				self.clipFinished( Bomb, {} )
				Hardpoint:completeAnimation()
				self.Hardpoint:setAlpha( 0 )
				self.clipFinished( Hardpoint, {} )
				Ball:completeAnimation()
				self.Ball:setAlpha( 0 )
				self.clipFinished( Ball, {} )
				FlagDom:completeAnimation()
				self.FlagDom:setAlpha( 0 )
				self.clipFinished( FlagDom, {} )
				Default:completeAnimation()
				self.Default:setAlpha( 1 )
				self.clipFinished( Default, {} )
			end,
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				FlagCTF:completeAnimation()
				self.FlagCTF:setAlpha( 0 )
				self.clipFinished( FlagCTF, {} )
				Bomb:completeAnimation()
				self.Bomb:setAlpha( 0 )
				self.clipFinished( Bomb, {} )
				Hardpoint:completeAnimation()
				self.Hardpoint:setAlpha( 0 )
				self.clipFinished( Hardpoint, {} )
				Ball:completeAnimation()
				self.Ball:setAlpha( 0 )
				self.clipFinished( Ball, {} )
				Default:completeAnimation()
				self.Default:setAlpha( 1 )
				self.clipFinished( Default, {} )
			end
		},
		FFA = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				FlagCTF:completeAnimation()
				self.FlagCTF:setAlpha( 0 )
				self.clipFinished( FlagCTF, {} )
				Bomb:completeAnimation()
				self.Bomb:setAlpha( 0 )
				self.clipFinished( Bomb, {} )
				Hardpoint:completeAnimation()
				self.Hardpoint:setAlpha( 0 )
				self.clipFinished( Hardpoint, {} )
				Ball:completeAnimation()
				self.Ball:setAlpha( 0 )
				self.clipFinished( Ball, {} )
				FlagDom:completeAnimation()
				self.FlagDom:setAlpha( 0 )
				self.clipFinished( FlagDom, {} )
				Default:completeAnimation()
				self.Default:setAlpha( 1 )
				self.clipFinished( Default, {} )
			end,
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				FlagCTF:completeAnimation()
				self.FlagCTF:setAlpha( 0 )
				self.clipFinished( FlagCTF, {} )
				Bomb:completeAnimation()
				self.Bomb:setAlpha( 0 )
				self.clipFinished( Bomb, {} )
				Hardpoint:completeAnimation()
				self.Hardpoint:setAlpha( 0 )
				self.clipFinished( Hardpoint, {} )
				Ball:completeAnimation()
				self.Ball:setAlpha( 0 )
				self.clipFinished( Ball, {} )
				Default:completeAnimation()
				self.Default:setAlpha( 1 )
				self.clipFinished( Default, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "CTF",
			condition = function ( menu, element, event )
				return IsGameTypeEqualToString( "ctf" )
			end
		},
		{
			stateName = "SDorSRorDem",
			condition = function ( menu, element, event )
				return IsBombBasedGameMode()
			end
		},
		{
			stateName = "Dom",
			condition = function ( menu, element, event )
				return IsGameTypeEqualToString( "dom" )
			end
		},
		{
			stateName = "Hardpoint",
			condition = function ( menu, element, event )
				return IsGameTypeEqualToString( "koth" )
			end
		},
		{
			stateName = "Uplink",
			condition = function ( menu, element, event )
				return IsGameTypeEqualToString( "ball" )
			end
		},
		{
			stateName = "Safeguard",
			condition = function ( menu, element, event )
				return IsGameTypeEqualToString( "dom" )
			end
		},
		{
			stateName = "GunGame",
			condition = function ( menu, element, event )
				return IsGameTypeEqualToString( "gun" )
			end
		},
		{
			stateName = "FFA",
			condition = function ( menu, element, event )
				return IsGameTypeEqualToString( "dm" )
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

